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
    
    func fetchQuickNEasyData() {
        QUICK_AND_EASY
//            .order(by: "title", descending: false)
            .getDocuments { querySnapshot, _ in
            guard let documents = querySnapshot?.documents else { return }
            
            DispatchQueue.main.async {
                self.quickNEasy = documents.compactMap({ try? $0.data(as: QuickNEasy.self) })
            }
        }
    }
}
