//
//  CalendarVM.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 26/12/21.
//

import Foundation
import SwiftUI

final class CalendarVM: ObservableObject {
    @Published var items = [CalendarModal]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        getCalendarList()
    }
    
    func getCalendarList() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([CalendarModal].self, from: savedItems) {
                let now = Date()
                let oneDateBefore = now-1*24*60*60
                let later = Date().addingTimeInterval(86313600)
                var actualDt: [CalendarModal] = []
                let _ = decodedItems.filter {dt in
                    let soon = dt.todayDate
                    let range = oneDateBefore...later
                    if range.contains(soon) {
                        actualDt.append(dt)
                    }
                    return true
                }
                let result = actualDt.sorted {
                    $0.todayDate > $1.todayDate
                }
                items = result
                return
            }
        }
        items = []
    }
}
