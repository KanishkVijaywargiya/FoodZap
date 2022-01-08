//
//  ListViewModel.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 08/01/22.
//

import Foundation

class ListViewModel: ObservableObject {
    // computed property
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    /// CRUD - retrieve
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second title!", isCompleted: true),
//            ItemModel(title: "This is the third title!", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    
    /// CRUD - delete
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    /// CRUD - create
    func addItem(title: String) {
        let newItems = ItemModel(title: title, isCompleted: false)
        items.append(newItems)
    }
    
    /// CRUD - update
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
