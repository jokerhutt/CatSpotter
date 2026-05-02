//
//  HomeViewModel.swift
//  CatSpotter
//
//  Created by David Glogowski on 02/05/2026.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var items: [CatItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "cats_list"
    
    init() {
        getItems()
    }
    
    func getItems () {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([CatItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(name: String, description: String, images: [Data]) {
        let newItem = CatItemModel(name: name, description: description, imageData: images)
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
    
}


