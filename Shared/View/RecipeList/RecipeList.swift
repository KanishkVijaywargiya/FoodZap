//
//  RecipeList.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 22/10/21.
//

import SwiftUI

struct RecipeList: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Recipes")
                    .font(.largeTitle).bold()
                    .padding(.bottom, 16)
                
                Spacer()
                
                SearchButton(iconName: "magnifyingglass")
                if #available(iOS 15.0, *) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.system(size: 32))
                        .padding(.leading, 8)
                        .symbolVariant(.circle)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(
                            Color.black.opacity(0.5)
                        )
                } else {
                    // Fallback on earlier versions
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .renderingMode(.template)
                        .font(.system(size: 32))
                        .foregroundColor(.primary)
                        .padding(.leading, 8)
                }
            }
            .padding(.horizontal, 8)
            
            ScrollView {
                ForEach(0 ..< 20) {_ in
                    ListRow()
                        .padding(.bottom, 8)
                }
            }
            Spacer()
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
