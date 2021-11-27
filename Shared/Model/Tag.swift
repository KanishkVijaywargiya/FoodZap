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
            Tag(title: "10 mins"),
            Tag(title: "20 mins"),
            Tag(title: "30 mins"),
            Tag(title: "40 mins"),
            Tag(title: "50 mins"),
            Tag(title: "60 mins"),
        ]
    }
    
    static var difficultTags: [Tag] {
        [
            Tag(title: "Easy"),
            Tag(title: "Moderate"),
            Tag(title: "Hard")
        ]
    }
    
    static var cusinesTags: [Tag] {
        [
            Tag(title: "Punjabi"),
            Tag(title: "Kashmiri"),
            Tag(title: "Bihari"),
            Tag(title: "Healthy"),
            Tag(title: "Indian"),
            Tag(title: "Korean"),
            Tag(title: "Chinese"),
            Tag(title: "Italian"),
            Tag(title: "Soups"),
            Tag(title: "Shakes"),
            Tag(title: "Street Foods"),
            Tag(title: "Rajasthani"),
            Tag(title: "Gujarati"),
            Tag(title: "Bengali"),
            Tag(title: "Goa"),
            Tag(title: "Snacks"),
            Tag(title: "Festive Specials"),
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
