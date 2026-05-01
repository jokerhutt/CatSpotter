//
//  AddViewModel.swift
//  CatSpotter
//
//  Created by David Glogowski on 02/05/2026.
//

import SwiftUI
import PhotosUI
import Combine

@MainActor
class AddViewModel: ObservableObject {

    @Published var selectedItems: [PhotosPickerItem] = [] {
        didSet {
            Task {
                await loadImages()
            }
        }
    }

    @Published var images: [UIImage] = []
    @Published var name: String = ""
    @Published var description: String = ""

    func loadImages() async {
        var loaded: [UIImage] = []
        for item in selectedItems {
            if let data = try? await item.loadTransferable(type: Data.self),
               let img = UIImage(data: data) {
                loaded.append(img)
            }
        }
        images = loaded
    }
    
}
