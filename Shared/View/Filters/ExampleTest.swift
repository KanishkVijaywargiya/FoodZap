//
//  ExampleTest.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 23/10/21.
//

import SwiftUI

struct ExampleTest: View {
    @State var tags: [Tag] = Tag.dummyTags
    @State var isSelectedValue: String = ""
    
    @State var tags1: [Tag] = Tag.dummyTags
    @State var isSelectedValue1: String = ""
    
    @State var tags2: [Tag] = Tag.dummyTags
    @State var isSelectedValue2: String = ""
    
    @State var tags3: [Tag] = Tag.dummyTags
    @State var isSelectedValue3: String = ""
    
    @State var tags4: [Tag] = Tag.dummyTags
    @State var isSelectedValue4: String = ""
    
    var body: some View {
        VStack {
            Text("Hello")
                .onTapGesture {
                    isSelectedValue = ""
                    isSelectedValue1 = ""
                    isSelectedValue2 = ""
                    isSelectedValue3 = ""
                    isSelectedValue4 = ""
                }
            ScrollView {
                ChipButton(tags: $tags, isSelectedValue: $isSelectedValue)
                ChipButton(tags: $tags1, isSelectedValue: $isSelectedValue1)
                ChipButton(tags: $tags2, isSelectedValue: $isSelectedValue2)
                ChipButton(tags: $tags3, isSelectedValue: $isSelectedValue3)
                ChipButton(tags: $tags4, isSelectedValue: $isSelectedValue4)
            }
        }
    }
}

struct ExampleTest_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTest()
    }
}
