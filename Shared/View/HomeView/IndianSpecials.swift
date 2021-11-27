//
//  IndianSpecials.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct IndianSpecials: View {
    var recipeData: [QuickNEasy]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("World Cuisine's")
                .font(.title).bold()
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            
            ForEach(recipeData) { item in
                VStack(alignment: .leading) {
                    NavigationLink(destination: DetailView(dishesData: item, favoriteType: .allFav)) {
                        BigCards(dummyData: item)
                            .frame(height: 350)
                            .padding(.bottom, 20)
                    }
                }
            }
        }
        .onAppear {
            URLCache.shared.memoryCapacity = 1024 * 1024 * 512
        }
    }
}

struct IndianSpecials_Previews: PreviewProvider {
    static var recipe = QuickNEasy.quickNEasy
    static var previews: some View {
        IndianSpecials(recipeData: recipe)
    }
}
