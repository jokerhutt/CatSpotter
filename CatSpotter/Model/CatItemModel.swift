//
//  CatItemModel.swift
//  CatSpotter
//
//  Created by David Glogowski on 30/04/2026.
//

import Foundation

struct CatItemModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let description: String
    let imageData: [Data]
    
    init(id: String = UUID().uuidString, name: String, description: String, imageData: [Data]) {
        self.id = id
        self.name = name
        self.description = description
        self.imageData = imageData
    }
    
    func updateCat() -> CatItemModel {
        return CatItemModel(id: id, name: name, description: description, imageData: imageData)
    }
    
}

