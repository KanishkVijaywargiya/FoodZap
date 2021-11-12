//
//  RecipeListViewModel.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 07/11/21.
//

import SwiftUI
import CoreData
import Firebase

final class RecipeListViewModel: ObservableObject {
    @Published var recipeList = [QuickNEasy]()
    
    // fetching data for recipe list
    func fetchRecipeList() {
        RECIPE_LIST.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            DispatchQueue.main.async {
                self.recipeList = documents.compactMap({ try? $0.data(as: QuickNEasy.self) })
            }
        }
    }
}

