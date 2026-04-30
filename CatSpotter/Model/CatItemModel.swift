//
//  CatItemModel.swift
//  CatSpotter
//
//  Created by David Glogowski on 30/04/2026.
//

import Foundation

struct CatItemModel: Identifiable {
    
    let id: String
    let name: String
    let imageUrl: String
    
    init(id: String = UUID().uuidString, name: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
    
    func updateCat() -> CatItemModel {
        return CatItemModel(id: id, name: name, imageUrl: imageUrl)
    }
    
}

