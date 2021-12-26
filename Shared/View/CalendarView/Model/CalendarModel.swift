//
//  CalendarModel.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 26/12/21.
//

import SwiftUI

struct CalendarModal: Identifiable, Codable {
    var id = UUID()
    let title: String
    let label: String
    let todayDate: Date
    let bgColor: String
    
    init(title: String, label: String, todayDate: Date, bgColor: String) {
        self.title = title
        self.label = label
        self.todayDate = todayDate
        self.bgColor = bgColor
    }
}

