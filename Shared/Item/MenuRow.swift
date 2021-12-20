//
//  MenuRow.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 20/12/21.
//

import SwiftUI

struct MenuRow: View {
    var title: String = "FAQ / Contact"
    var leftIcon: String = "questionmark"
    
    var body: some View {
        HStack(spacing: 12.0) {
            GradientIcon(icon: leftIcon)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}
