//
//  CalendarCell.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 26/12/21.
//

import SwiftUI

struct CalendarCell: View {
    var title: String
    var label: String
    var time: Date
    var bgCols: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top, spacing: 0) {
                Text(title)
                    .font(.custom("American Typewriter", size: 18).bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(label)
                    .font(.custom("American Typewriter", size: 18).bold())
                    .foregroundColor(.white)
            }
            Text(time.formatted(.dateTime.weekday(.wide).month().day().year()))
                .font(.custom("American Typewriter", size: 14).bold())
        }
        .padding()
        .background(bgCols)
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.white, lineWidth: 1.9)
                .blendMode(.normal)
                .opacity(0.7)
        )
        .cornerRadius(12)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(title: "Paneer butter masala", label: "Dinner", time: Date(), bgCols: Color(hex: "#25CCF7"))
    }
}
