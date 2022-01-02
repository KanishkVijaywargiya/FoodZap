//
//  BottomTabView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 24/12/21.
//

import SwiftUI

struct BottomTabView: View {
    @ObservedObject var monitor = NetworkReachability()
    @StateObject var quickNEasyVM = QuickNEasyViewModel()
    @StateObject var RecipeListVM = RecipeListViewModel()
    
    @State private var home = UUID()
    @State private var todo = UUID()
    @State private var calendar = UUID()
    @State private var tabSelection = 1
    @State private var tappedTwice = false
    
    var handler: Binding<Int> { Binding(
        get: { self.tabSelection },
        set: {
            if $0 == self.tabSelection {
                tappedTwice = true
            }
            self.tabSelection = $0
        }
    )}
    
    var body: some View {
        if monitor.isConnected {
            if (RecipeListVM.recipeList.count > 0 && quickNEasyVM.quickNEasy.count > 0) {
                TabView(selection: handler) {
                    NavigationView {
                        VStack {
                            HomeView()
                                .id(home)
                                .onChange(of: tappedTwice, perform: { tappedTwice in
                                    guard tappedTwice else { return }
                                    home = UUID()
                                    self.tappedTwice = false
                                })
                                .foregroundColor(.black)
                        }
                    }
                    .tabItem {
                        Image(systemName: "house")
                            .renderingMode(.original)
                        Text("Foods")
                    }.tag(1)
                    
                    NavigationView {
                        TodoListView()
                            .id(todo)
                            .onChange(of: tappedTwice, perform: { tappedTwice in
                                guard tappedTwice else { return }
                                todo = UUID()
                                self.tappedTwice = false
                            })
                    }
                    .tabItem {
                        Image(systemName: "note.text")
                            .renderingMode(.original)
                        Text("Grocery List")
                    }.tag(2)
                    
                    NavigationView {
                        CalendarView()
                            .id(calendar)
                            .onChange(of: tappedTwice, perform: { tappedTwice in
                                guard tappedTwice else { return }
                                calendar = UUID()
                                self.tappedTwice = false
                            })
                    }
                    .tabItem {
                        Image(systemName: "calendar")
                            .renderingMode(.original)
                        Text("Calendar")
                    }.tag(3)
                }
                .accentColor(Color(hex: Colors.accentColors))
            } else {
                ProgressView()
                    .scaleEffect(1, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
            }
        } else {
            NetworkCheckView()
        }
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
