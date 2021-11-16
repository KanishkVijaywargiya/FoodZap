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
    @State private var openDetail = false
    
    @State var fullSheetData: QuickNEasy? = nil
    @State private var filterSheet = false
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
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
                                    ListRow(fullListItem: item)
                                        .padding(.bottom, 8)
                                        .onTapGesture {
                                            self.openDetail.toggle()
                                            self.fullSheetData = item
                                        }
                                        .fullScreenCover(item: $fullSheetData) {items in
                                            DetailView(dishesData: items)
                                        }
                                }
                            }
                        }
                    }
                    .searchable(text: $searchingFor)
                }
            }
            .foregroundColor(.black)
        }
        .navigationBarTitle("Recipes")
        .navigationBarItems(
            trailing:
                Image(systemName: "line.3.horizontal.decrease.circle")
                .font(.system(size: 20))
                .padding(.leading, 8)
                .symbolVariant(.circle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    Color(hex: Colors.accentColors)
                )
                .onTapGesture {
                    self.filterSheet.toggle()
                }
        )
        .onReceive(timer) { input in
            changeLayout = true
        }
        .sheet(isPresented: $filterSheet) {
            Filters()
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
