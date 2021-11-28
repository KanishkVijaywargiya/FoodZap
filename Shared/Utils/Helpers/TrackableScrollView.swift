//
//  TrackableScrollView.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 28/11/21.
//

import SwiftUI

// <Content: View> - Means to pass content in this view of type View
struct TrackableScrollView<Content: View>: View {
    let axes: Axis.Set
    let offsetChanged: (CGPoint) -> Void // Function same as button click void function
    let content: Content
    
    // in init setting the default values and with initialization
    // By adding @escaping, the value of offsetChanged will be accessible in the closure inside of the view where we will be using trackablescrollview
    init(axes: Axis.Set = .vertical, offsetChanged: @escaping (CGPoint) -> Void = { _ in }, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    var body: some View {
        SwiftUI.ScrollView(axes) {
//            GeometryReader { geometry in
//                Color.clear.preference(key: ScrollOffsetPrefereceKey.self, value: geometry.frame(in: .named("scrollView")).origin)
//            }
//            .frame(width: 0, height: 0)
            
            content
        }
        .coordinateSpace(name: "scrollView") // kind of lika an ID that we are giving to our ScrollView
        .onPreferenceChange(ScrollOffsetPrefereceKey.self, perform: offsetChanged)
    }
}

// Preference Key let us pass data from each child up to its parent. In this case, the offsetChanged value will be passed inside of a GeometryReader to its parent
private struct ScrollOffsetPrefereceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

