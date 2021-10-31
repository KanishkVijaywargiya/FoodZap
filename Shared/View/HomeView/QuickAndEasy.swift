//
//  QuickAndEasy.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct QuickAndEasy: View {
    @StateObject var quickNEasyVM = QuickNEasyViewModel()
    
    // MARK: Quick and Easy Horizontal Cards
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(quickNEasyVM.quickNEasy) { item in
                    GeometryReader { geo in
                        NavigationLink(destination: DetailView(dishesData: item)) {
                            HorizontalScrollCards(dummyData: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geo.frame(in: .global).minX - 30) / -getAngleMultiplier(bounds: geo )),
                                    axis: (x: 0, y: 10, z: 0)
                                )
                        }
                    }
                    .frame(width: 280, height: 360)
                }
            }
            .padding(20)
            .padding(.bottom, 30)
        }
    }
    
    // setting angle for horizontal card
    func getAngleMultiplier(bounds: GeometryProxy) -> Double {
        if bounds.size.width > 500 {
            return 80
        }else {
            return 20
        }
    }
}

struct QuickAndEasy_Previews: PreviewProvider {
    static var previews: some View {
        QuickAndEasy()
    }
}
