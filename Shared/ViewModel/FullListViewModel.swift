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
}
