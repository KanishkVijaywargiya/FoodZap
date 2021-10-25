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
                
                SeeMoreButton()
                
                // Indian specials
                IndianSpecials().padding(.top, 26)
                
                SeeMoreButton().padding(.top, 26)
                
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
