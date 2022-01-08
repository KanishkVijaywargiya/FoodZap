//
//  TodoListView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 24/12/21.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var listVM: ListViewModel
    @StateObject var hapticVM = HapticViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            if listVM.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listVM.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                hapticVM.impact(style: .heavy)
                                hapticVM.haptic(type: .warning)
                                listVM.updateItem(item: item)
                            }
//                            .listRowBackground(BlurView(style: .systemMaterial))
                    }
                    .onDelete(perform: listVM.deleteItem)
                    .onMove(perform: listVM.moveItem)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 14)
            }
        }
        .navigationTitle("Todo List ✏️")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }.accentColor(Color(hex: "#3498DB"))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView().environmentObject(ListViewModel())
    }
}

