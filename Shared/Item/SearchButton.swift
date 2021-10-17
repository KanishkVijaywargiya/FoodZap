//
//  SearchButton.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct SearchButton: View {
    // MARK: Search Button
    
    var body: some View {
        Image(systemName: "magnifyingglass")
            .renderingMode(.template)
            .font(.system(size: 16))
            .foregroundColor(.primary)
            .padding(8)
            .background(
                BlurView(style: .light)
            )
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), lineWidth: 0.2)
            )
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton()
    }
}
