//
//  QuickNEasyViewModel.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 30/10/21.
//

import SwiftUI
import Firebase

final class QuickNEasyViewModel: ObservableObject {
    @Published var quickNEasy: [QuickNEasy] = []
    
    init() {
        fetchQuickNEasyData()
    }
    
    func fetchQuickNEasyData() {
        QUICK_AND_EASY.getDocuments { querySnapshot, _ in
            guard let documents = querySnapshot?.documents else { return }
            
            for document in documents {
                let data = document.data()
                
                let backgroundImg = data["backgroundImg"] as? String ?? ""
                let calories = data["calories"] as? String ?? ""
                let carbohydrates = data["carbohydrates"] as? String ?? ""
                let category = data["category"] as? String ?? ""
                let course = data["course"] as? String ?? ""
                let cusine = data["cusine"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let difficultyLevel = data["difficultyLevel"] as? String ?? ""
                let fat = data["fat"] as? String ?? ""
                let healthPreference = data["healthPreference"] as? String ?? ""
                let procedureVideo = data["procedureVideo"] as? String ?? ""
                let protein = data["protein"] as? String ?? ""
                let time = data["time"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let ingridients = data["ingridients"] as? [String] ?? []
                let procedure = data["procedure"] as? [String] ?? []
                let isFav = data["isFav"] as? Bool ?? false
                
                let quickNEasyDt = QuickNEasy(backgroundImg: backgroundImg, calories: calories, carbohydrates: carbohydrates, category: category, course: course, cusine: cusine, description: description, difficultyLevel: difficultyLevel, fat: fat, healthPreference: healthPreference, procedureVideo: procedureVideo, protein: protein, time: time, title: title, ingridients: ingridients, procedure: procedure, isFav: isFav)
                
                self.quickNEasy.append(quickNEasyDt)
            }
        }
    }
}
