//
//  BottomTabView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 24/12/21.
//

import SwiftUI

struct BottomTabView: View {
    @Binding var currentTab: Int
    @ObservedObject var monitor = NetworkReachability()
    
    var body: some View {
        if monitor.isConnected {
            TabView(selection: $currentTab) {
                NavigationView {
                    VStack {
                        HomeView()
                            .foregroundColor(.black)
                            .onTapGesture {
                                currentTab = 0
                            }
                    }
                }
                .tabItem {
                    Image(systemName: "house")
                        .renderingMode(.original)
                    Text("Foods")
                }.tag(0)
                
                NavigationView {
                    TodoListView()
                        .onTapGesture {
                            currentTab = 1
                        }
                }
                .tabItem {
                    Image(systemName: "note.text")
                        .renderingMode(.original)
                    Text("Grocery List")
                }.tag(1)
                
                NavigationView {
                    CalendarView()
                        .onTapGesture {
                            currentTab = 2
                        }
                }
                .tabItem {
                    Image(systemName: "calendar")
                        .renderingMode(.original)
                    Text("Calendar")
                }.tag(2)
            }
            .accentColor(Color(hex: Colors.accentColors))
        } else {
            NetworkCheckView()
        }
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView(currentTab: .constant(0))
    }
}
