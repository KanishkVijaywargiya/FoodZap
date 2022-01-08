//
//  ListRowView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 08/01/22.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First title!", isCompleted: false)
    static var item2 = ItemModel(title: "Second title!", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
