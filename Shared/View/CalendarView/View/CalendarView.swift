//
//  CalenderView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 24/12/21.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var scheduleFoods = CalendarVM()
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            List {
                ForEach(scheduleFoods.items) { item in
                    CalendarCell(title: item.title, label: item.label, time: item.todayDate, bgCols: Color(hex: item.bgColor))
                }
                .onDelete(perform: removeItems)
                .listRowBackground(Color(hex: Colors.backgroundCol))
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .onAppear {
            scheduleFoods.getCalendarList()
        }
        .navigationTitle("Food Schedule")
    }
    
    func removeItems(at offsets: IndexSet) {
        scheduleFoods.items.remove(atOffsets: offsets)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

