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
    @Published var recipeList: [QuickNEasy] = []
    
    init() {
        self.fetchRecipeList()
    }
    
    // fetching data for recipe list
    func fetchRecipeList() {
        RECIPE_LIST.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            DispatchQueue.main.async {
                let recipeArr = documents.compactMap({ try? $0.data(as: QuickNEasy.self) })
                let koreanFoods = recipeArr.filter({ $0.cusine == "Korean"}).shuffled().first
                let italianFoods = recipeArr.filter({ $0.cusine == "Italian"}).shuffled().first
                let chineseFoods = recipeArr.filter({ $0.cusine == "Chinese"}).shuffled().first
                //                let indianFoods = recipeArr.filter({ $0.cusine == "Indian"}).shuffled().first
                
                if ((koreanFoods != nil)
                    //                    && (italianFoods != nil) && (chineseFoods != nil)
                ){
                    self.recipeList.insert(koreanFoods!, at: 0)
                    //                    self.recipeList.insert(italianFoods!, at: 1)
                    //                    self.recipeList.insert(chineseFoods!, at: 2)
                }
            }
        }
    }
}

