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
    static var timeTags: [Tag] {
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
    
    static var difficultTags: [Tag] {
        [
            Tag(title: "Beginner"),
            Tag(title: "Intermediate"),
            Tag(title: "Expert")
        ]
    }
    
    static var cusinesTags: [Tag] {
        [
            Tag(title: "Continental"),
            Tag(title: "Indian"),
            Tag(title: "Korean"),
            Tag(title: "Chinese"),
            Tag(title: "Italian")
        ]
    }
    
    static var healthTags: [Tag] {
        [
            Tag(title: "Sugar free"),
            Tag(title: "Diabetic control"),
            Tag(title: "Fat control")
        ]
    }
    
    static var categoriesTags: [Tag] {
        [
            Tag(title: "Veg"),
            Tag(title: "Non-Veg"),
            Tag(title: "Jain"),
            Tag(title: "Eggiterian"),
        ]
    }
}
