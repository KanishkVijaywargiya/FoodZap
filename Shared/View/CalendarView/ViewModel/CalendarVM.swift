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
                let newData = decodedItems.filter {
                    $0.todayDate.formatted(.dateTime.month().year()) >= Date().formatted(.dateTime.month().year())
                }
                
                let result = newData.sorted {
                    $0.todayDate > $1.todayDate
                }
                items = result
                return
            }
        }
        items = []
    }
}
