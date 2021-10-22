//
//  ContentView.swift
//  Shared
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                Group {
                    // hello username
                    helloUsername()
                    
                    // title, search, profile button
                    HStack(spacing: 0) {
                        Text("Quick & Easy")
                            .font(.largeTitle).bold()
                            .padding(.horizontal, 20)
                            .padding(.bottom, 16)
                        
                        Spacer()
                        
                        SearchButton(iconName: "magnifyingglass")
                        ProfileButton()
                    }
                    
                    // horizontal scroll cards
                    QuickAndEasy()
                    
                    
                    // indian cuisines
                    IndianCuisines()
                    
                    // foreign cuisines
                    ForeignCuisines().padding(.top, 26)
                    
                    // festive specials
                    FestiveSpecials().padding(.top, 26)
                }
                
                Group {
                    // stay fit
                    StayFit().padding(.top, 26)
                    
                    // soups cuisines
                    SoupsCuisines().padding(.top, 26)
                    
                    // shakes cuisines
                    ShakesCuisines().padding(.top, 26)
                    
                    // mood recipies
                    MoodRecipe().padding(.top, 26)
                    
                    // street foods
                    StreetFoods().padding(.top, 26)
                    
                    // Indian specials
                    IndianSpecials().padding(.top, 26)
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
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
