//
//  FoodsCollections.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 20/10/21.
//

import SwiftUI
import Firebase

struct QuickNEasy: Identifiable {
    var id = UUID()
    var backgroundImg: String
    var calories: String
    var carbohydrates: String
    var category: String
    var course: String
    var cusine: String
    var description: String
    var difficultyLevel: String
    var fat: String
    var healthPreference: String
    var procedureVideo: String
    var protein: String
    var time: String
    var title: String
    var ingridients: [String]
    var procedure: [String]
    var isFav: Bool
}

