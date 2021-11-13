//
//  RecipeList.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 22/10/21.
//

import SwiftUI

struct RecipeList: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var fullListVM = FullListViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            VStack {
                HStack(spacing: 0) {
                    GlassButton(iconName: "chevron.backward")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    VStack {}.padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Text("Recipes")
                        .font(.largeTitle).bold()
                    
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
                    ForEach(fullListVM.fullList) { item in
                        NavigationLink(destination: DetailView(dishesData: item)) {
                            ListRow(fullListItem: item)
                                .padding(.bottom, 8)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .foregroundColor(.black)
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
