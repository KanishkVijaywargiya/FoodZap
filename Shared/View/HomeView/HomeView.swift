//
//  ContentView.swift
//  Shared
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @ObservedObject var quickNEasyVM = QuickNEasyViewModel()
    @ObservedObject var RecipeListVM = RecipeListViewModel()
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: QuickEasy.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \QuickEasy.title, ascending: true)]) var results: FetchedResults<QuickEasy>
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // hello username
                    helloUsername()
                    
                    // title, search, profile button
                    HStack(spacing: 0) {
                        Text("Quick & Easy")
                            .font(.largeTitle).bold()
                            .padding(.horizontal, 20)
                            .padding(.bottom, 16)
                        
                        Spacer()
                        
                        ProfileButton()
                    }
                    
                    // horizontal scroll cards
                    QuickAndEasy(quickNEasyData: quickNEasyVM.quickNEasy)
                    
                    NavigationLink(destination: RecipeList()) {
                        SeeMoreButton()
                    }
                    
                    // Indian specials
                    IndianSpecials(recipeData: RecipeListVM.recipeList)    
                    
                    NavigationLink(destination: RecipeList()) {
                        SeeMoreButton().padding(.top, 26)
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            quickNEasyVM.fetchQuickNEasyData(context: viewContext)
            RecipeListVM.fetchRecipeList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct helloUsername: View {
    var body: some View {
        Text("Hello Kanishk")
            .font(Font.headline.bold())
            .padding(.top)
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
    }
}
