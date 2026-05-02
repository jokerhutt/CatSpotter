//
//  DevData.swift
//  CatSpotter
//
//  Created by David Glogowski on 02/05/2026.
//

import SwiftUI

enum DevData {

    static func load(_ name: String, ext: String) -> Data {

        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {

            fatalError("Missing \(name).\(ext)")

        }

        return try! Data(contentsOf: url)

    }

    static let items: [CatItemModel] = [

        CatItemModel(name: "Tabby", description: "Grumpy", imageData: [load("1", ext: "jpeg")]),

        CatItemModel(name: "Silly", description: "Wonky", imageData: [load("2", ext: "jpeg")]),

        CatItemModel(name: "Ocelot", description: "Not sure", imageData: [load("3", ext: "jpg")]),

        CatItemModel(name: "Doorbell", description: "Curious", imageData: [load("4", ext: "jpg")]),

        CatItemModel(name: "Polite", description: "Treat", imageData: [load("5", ext: "jpg")]),

        CatItemModel(name: "Evil", description: "Uh oh", imageData: [load("6", ext: "gif")])

    ]

    static var vm: HomeViewModel {

        let vm = HomeViewModel()

        vm.items = items

        return vm

    }

}
