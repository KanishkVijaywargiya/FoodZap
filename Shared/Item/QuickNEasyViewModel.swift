//
//  QuickNEasyViewModel.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 30/10/21.
//

import SwiftUI
import CoreData
import Firebase

final class QuickNEasyViewModel: ObservableObject {
    @Published var quickNEasy = [QuickNEasy]()
    
    // save to Core Data
    func saveData(context: NSManagedObjectContext) {
                quickNEasy.forEach { data in
                    let dishesDataToSave = QuickEasy(context: context)
                    dishesDataToSave.title = data.title
        //            dishesDataToSave.id = UUID()
                    dishesDataToSave.backgroundImg = data.backgroundImg
                    dishesDataToSave.calories = data.calories
                    dishesDataToSave.carbohydrates = data.carbohydrates
                    dishesDataToSave.category = data.category
                    dishesDataToSave.course = data.course
                    dishesDataToSave.cusine = data.cusine
                    dishesDataToSave.descriptions = data.descriptions
                    dishesDataToSave.difficultyLevel = data.difficultyLevel
                    dishesDataToSave.fat = data.fat
                    dishesDataToSave.healthPreference = data.healthPreference
                    dishesDataToSave.procedureVideo = data.procedureVideo
                    dishesDataToSave.protein = data.protein
                    dishesDataToSave.time = data.time
                    dishesDataToSave.ingridients = data.ingridients as NSObject
                    dishesDataToSave.procedure = data.procedure as NSObject
                    dishesDataToSave.isFav = data.isFav
                    
                    print("dishesDataToSave-----", dishesDataToSave)
                }
        
        // saving all data at once to core data
        do {
            try context.save()
            print("Save Array to Core Data - Success")
        } catch {
            print("Error Core Data not saved- \(error.localizedDescription)")
        }
    }
    
    func fetchQuickNEasyData(context: NSManagedObjectContext) {
        QUICK_AND_EASY
//            .order(by: "title", descending: false)
            .getDocuments { querySnapshot, _ in
            guard let documents = querySnapshot?.documents else { return }
            
            DispatchQueue.main.async {
                self.quickNEasy = documents.compactMap({ try? $0.data(as: QuickNEasy.self) })
                self.saveData(context: context)
            }
        }
    }
}
