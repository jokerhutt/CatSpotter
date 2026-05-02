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
    
    let latitude: Double
    let longitude: Double

    
    init(id: String = UUID().uuidString, name: String, description: String, imageData: [Data], latitude: Double = 52.373870, longitude: Double = 4.899330) {
        self.id = id
        self.name = name
        self.description = description
        self.imageData = imageData
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func updateCat() -> CatItemModel {
        return CatItemModel(id: id, name: name, description: description, imageData: imageData, latitude: latitude, longitude: longitude, )
    }
    
}

