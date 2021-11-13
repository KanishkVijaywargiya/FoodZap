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
    
    @State var searchingFor = ""
    @State var changeLayout = false
    @State private var hasTitle = true
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            VStack {
                //                HStack(spacing: 0) {
                //                    GlassButton(iconName: "chevron.backward")
                //                        .onTapGesture {
                //                            presentationMode.wrappedValue.dismiss()
                //                        }
                //
                //                    VStack {}.padding(.horizontal, 20)
                //
                //                    Spacer()
                //
                //                    Text("Recipes")
                //                        .font(.largeTitle).bold()
                //
                //                    Spacer()
                //
                //                    SearchButton(iconName: "magnifyingglass")
                //
                //                    if #available(iOS 15.0, *) {
                //                        Image(systemName: "line.3.horizontal.decrease.circle")
                //                            .font(.system(size: 32))
                //                            .padding(.leading, 8)
                //                            .symbolVariant(.circle)
                //                            .symbolRenderingMode(.palette)
                //                            .foregroundStyle(
                //                                Color.black.opacity(0.5)
                //                            )
                //                    } else {
                //                        // Fallback on earlier versions
                //                        Image(systemName: "line.3.horizontal.decrease.circle")
                //                            .renderingMode(.template)
                //                            .font(.system(size: 32))
                //                            .foregroundColor(.primary)
                //                            .padding(.leading, 8)
                //                    }
                //                }
                //                .padding(.horizontal, 8)
                
                
                VStack {
                    if fullListVM.fullList.isEmpty {
                        if changeLayout {
                            ChangeLayoutView()
                        } else {
                            PlaceholderFullList()
                        }
                    } else {
                        VStack {
                            if results.isEmpty {
                                EmptyResultView()
                            } else {
                                ScrollView {
                                    ForEach(results) { item in
                                        NavigationLink(destination: DetailView(dishesData: item)
                                                        .onAppear {
                                            self.hasTitle = false
                                        }
                                                        .onDisappear {
                                            self.hasTitle = true
                                        }
                                        ) {
                                            ListRow(fullListItem: item)
                                                .padding(.bottom, 8)
                                        }
                                    }
                                }
                            }
                        }
                        .searchable(text: $searchingFor)
                    }
                }
            }
            .foregroundColor(.black)
        }
        .navigationBarTitle(self.hasTitle ? Text("Recipes") : Text(""))
        .navigationBarItems(trailing:
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(.system(size: 20))
                                .padding(.leading, 8)
                                .symbolVariant(.circle)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(
                                    Color.black.opacity(0.5)
                                )
        )
        .onReceive(timer) { input in
            changeLayout = true
        }
    }
    
    var results: [QuickNEasy] {
        return searchingFor.isEmpty ? fullListVM.fullList.sorted {
            $0.title < $1.title
        } : fullListVM.filteredFood(searchingFor).sorted {
            $0.title < $1.title
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}

struct PlaceholderFullList: View {
    var body: some View {
        List(0..<8) {section in
            VStack {
                HStack(alignment: .top) {
                    ZStack {
                        Image("swiftuihandbook")
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70, alignment: .center)
                            .cornerRadius(8)
                    }
                    .padding(.top, 2)
                    VStack(alignment: .leading) {
                        Text("fullListItem.title")
                            .font(.title)
                            .bold()
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Text("fullListItem.time")
                            .font(.subheadline)
                        
                        Text("fullListItem.descriptions")
                            .font(.footnote)
                            .lineLimit(4)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 1)
                    }
                    .padding(.leading, 8)
                    .padding(.top, 0)
                    Spacer()
                }
            }
            .redacted(reason: .placeholder)
            
        }
    }
}

struct ChangeLayoutView: View {
    var body: some View {
        Text("Empty")
    }
}

struct EmptyResultView: View {
    var body: some View {
        ScrollView {
            Text("No results")
        }
    }
}
