//
//  DummyData.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct DummyData: Identifiable {
    var id = UUID()
    var backgroundImg: String
    var title: String
    var subTitle: String
    var description: String
    var image1: String
    var image2: String
    var gradient1: Color
    var gradient2: Color
    var gradient3: Color
}

extension DummyData {
    static var dummyData: [DummyData] {
        [
            DummyData(backgroundImg: "swiftuihandbook", title: "SwiftUI Concurrency", subTitle: "20 sections - 3 hours", description: "Concurrency, swipe actions, search feature, AttributedStrings and accessibility were concepts discussed at WWDC21. This course explores all these", image1: "swiftuilogo", image2: "mengto", gradient1: Color(#colorLiteral(red: 0.01960784314, green: 0.4588235294, blue: 0.9019607843, alpha: 1)), gradient2: Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), gradient3: Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1))),

            DummyData(backgroundImg: "swiftuihandbook", title: "SwiftUI Concurrency", subTitle: "20 sections - 3 hours", description: "Concurrency, swipe actions, search feature, AttributedStrings and accessibility were concepts discussed at WWDC21. This course explores all these", image1: "swiftuilogo", image2: "mengto", gradient1: Color(#colorLiteral(red: 0.4, green: 0.6, blue: 1, alpha: 1)), gradient2: Color(#colorLiteral(red: 0, green: 0, blue: 0.4, alpha: 1)), gradient3: Color(#colorLiteral(red: 0, green: 0, blue: 0.4, alpha: 1))),
            
            DummyData(backgroundImg: "swiftuihandbook", title: "SwiftUI Concurrency", subTitle: "20 sections - 3 hours", description: "Concurrency, swipe actions, search feature, AttributedStrings and accessibility were concepts discussed at WWDC21. This course explores all these", image1: "swiftuilogo", image2: "mengto", gradient1: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), gradient2: Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), gradient3: Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1))),
            
            DummyData(backgroundImg: "swiftuihandbook", title: "SwiftUI Concurrency", subTitle: "20 sections - 3 hours", description: "Concurrency, swipe actions, search feature, AttributedStrings and accessibility were concepts discussed at WWDC21. This course explores all these", image1: "swiftuilogo", image2: "mengto", gradient1: Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), gradient2: Color(#colorLiteral(red: 0.4156862745, green: 0.1882352941, blue: 0.5764705882, alpha: 1)), gradient3: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
        ]
    }
}

