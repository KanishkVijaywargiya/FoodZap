//
//  FoodsCollections.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 20/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct QuickNEasy: Identifiable, Codable {
    @DocumentID var id: String?
//    var id = UUID()
    var backgroundImg: String
    var calories: String
    var carbohydrates: String
    var category: String
    var course: String
    var cusine: String
    var descriptions: String
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

extension QuickNEasy {
    static var quickNEasy: [QuickNEasy] {
        [
            QuickNEasy(backgroundImg: "", calories: "247kcal", carbohydrates: "25g", category: "Veg", course: "Punjabi", cusine: "Main Course", descriptions: "Punjabi Kadhi sans pakoda is made with chickpea flour, yogurt, and spices. This slightly tangy and delicious dish is also known as Kadhi Chawal.", difficultyLevel: "Modarate", fat: "13g", healthPreference: "Gluten free", procedureVideo: "", protein: "10g", time: "45 mins", title: "Punjabi Kadhi", ingridients: [
                "For chickpea flour (besan) mixture",
                "1 cup chickpea flour/besan",
                "2 cups yogurt",
                "4 cups water",
                "pinch of turmeric powder",
                
                "For the kadhi",
                "11/2 tbsp avocado oil",
                "1/2 tsp turmeric powder",
                "1/4 tsp asafoetida/hing for gluten-free, use GF hing",
                "1 tsp mustard seeds",
                "1 tsp cumin seeds",
                "1/2 tsp fenugreek seeds methi",
                "3 cloves",
                "1 dry red chili",
                "12 curry leaves",
                "1 large red onion sliced",
                "1 inch piece ginger chopped",
                "4 cloves garlic chopped",
                "1/2 tsp chili powder",
                "2 tsp coriander powder",
                "3/4 tsp salt (season kadhi) + a little salt (for onions)",
                "add chickpea flour (besan) mixture",
                "1-2 cups water (optional.. for thinner gravy)",
                "1/2 tsp garam masala",
                "2 tsp mango powder amchoor",
                "2 tsp dry fenugreek leaves/kasoori methi",
                
                "For the tadka/tempering",
                "1 tbsp avocado oil",
                "2 dry red chilies",
                "1/2 tsp Kashmiri red chili or paprika",
                
                "For garnish",
                "fresh cilantro leaves",
                "pour tadka/tempering on top"
            ], procedure: [
                "For chickpea flour (besan) mixture",
                "Mix the chickpea flour and yogurt together to get rid of lumps, then add water.",
                "Use a whisk to mix well.",
                "Add a pinch of turmeric powder. Set aside for 1/2 hour.",
                "Slice the onions. Chop the ginger and garlic.",
                "Set aside the spices - curry pata, hing, turmeric powder, cumin seeds, cloves, fenugreek seeds, mustard seeds, and one dry red chili.",
                
                "For the kadhi",
                "Heat up a pot on medium heat, once hot, add oil.",
                "Add the spices, saute for 30 seconds.",
                "Add the ginger and garlic. Saute for 30-45 seconds.",
                "Now add the onions. Saute for 3 minutes.",
                "Add red chili powder, coriander powder, and a little salt to season the onions. Stir.",
                "Slowly pour the besan-yogurt-water mixture to avoid curdling.",
                "Stir, season with 3/4 tsp of salt, and cook on medium heat for about 5 minutes - until the kadhi starts boiling away.",
                "This is what you should have 5 minutes later, the kadhi will get thick.",
                "Cover with a lid and cook the kadhi for 15 minutes on low-medium heat.",
                "This is what you should have. Taste and adjust seasonings if need be. Add more water if you prefer your kadhi thinner (1-2 cups max).",
                "Add mango powder, dry fenugreek leaves, and garam masala. Stir and turn off the stove.",
                
                "For the tadka/tempering",
                "Heat up a pan on medium heat. Once hot, add oil followed by dry red chilies and Kashmiri chili powder. Cook for about 1-2 minutes max. Turn off the stove.",
                "Pour tadka over kadhi and garnish with fresh cilantro leaves."
            ], isFav: false)
        ]
    }
}
