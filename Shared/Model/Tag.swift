//
//  Tag.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 23/10/21.
//

import SwiftUI

struct Tag: Identifiable, Hashable {
    let id = UUID()
    var title: String
}

extension Tag {
    static var dummyTags: [Tag] {
        [
            Tag(title: "10 min"),
            Tag(title: "20 min"),
            Tag(title: "30 min"),
            Tag(title: "40 min"),
            Tag(title: "50 min"),
            Tag(title: "60 min"),
            Tag(title: "other items")
        ]
    }
}
