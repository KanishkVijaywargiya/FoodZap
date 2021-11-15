//
//  CategoryLogo.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 15/11/21.
//

import SwiftUI

struct CategoryLogo: View {
    var shade: String
    
    var body: some View {
        Circle()
            .foregroundColor(Color(hex: shade))
            .frame(width: 10, height: 10)
            .padding(4)
            .overlay(
                Rectangle()
                    .stroke(Color(hex: shade), lineWidth: 3)
            )
    }
}

struct CategoryLogo_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLogo(shade: "#019031")
    }
}
