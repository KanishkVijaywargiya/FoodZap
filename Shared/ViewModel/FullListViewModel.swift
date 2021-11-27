//
//  FullListViewModel.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 13/11/21.
//

import SwiftUI
import CoreData
import Firebase

final class FullListViewModel: ObservableObject {
    @Published var fullList: [QuickNEasy] = []
    
    init() {
        self.fetchFullList()
    }
    
    // fetching data for recipe list
    func fetchFullList() {
        RECIPE_LIST.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            DispatchQueue.main.async {
                self.fullList = documents.compactMap({ try? $0.data(as: QuickNEasy.self) })
            }
        }
    }
    
    // search bar filter code
    func filteredFood(_ query: String) -> [QuickNEasy] {
        let lowerCasedQuery = query.lowercased()
        return fullList.filter({ $0.title.lowercased().contains(lowerCasedQuery) || $0.cusine.lowercased().contains(lowerCasedQuery) || $0.course.lowercased().contains(lowerCasedQuery) || $0.category.lowercased().contains(lowerCasedQuery) || $0.healthPreference.lowercased().contains(lowerCasedQuery)  })
    }
    
    func filterPeFilter(_ query: String, val3: String?) -> [QuickNEasy] {
        let lowerCasedQuery = query.lowercased()
        return fullList.filter({
//            $0.time.lowercased().contains(val1 ?? "") &&
//            $0.difficultyLevel.lowercased().contains(val2 ?? "") &&
            $0.cusine.contains(val3 ?? "")
        }).filter({
            $0.title.lowercased().contains(lowerCasedQuery) || $0.cusine.lowercased().contains(lowerCasedQuery) || $0.course.lowercased().contains(lowerCasedQuery)
        })
    }
    
    // func for adding favorite
    func addToFav(_ favEnum: FavType, of reciepeId: String?) {
        guard let recId = reciepeId else { return }
        if favEnum == .quickFav {
            QUICK_AND_EASY.document(recId).updateData(["isFav" : true]) {_ in
                //            self.isFav = true
            }
        } else {
            RECIPE_LIST.document(recId).updateData(["isFav" : true]) {_ in
                //            self.isFav = true
            }
        }
    }
    
    
    // func for removing items from favorite
    func removeFav(_ favEnum: FavType, of reciepeId: String?) {
        guard let recId = reciepeId else { return }
        if favEnum == .quickFav {
          QUICK_AND_EASY.document(recId).updateData(["isFav" : false]) {_ in
//            self.isFav = false
          }
        } else {
          RECIPE_LIST.document(recId).updateData(["isFav" : false]) {_ in
//            self.isFav = false
          }
        }
      }
}
