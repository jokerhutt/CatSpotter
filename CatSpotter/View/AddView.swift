//
//  AddView.swift
//  CatSpotter
//
//  Created by David Glogowski on 01/05/2026.
//

import PhotosUI
import SwiftUI

struct AddView: View {
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    @State var catNameFieldText: String = ""
    @State var catDescriptionFieldText: String = ""
    
    var body: some View {
        VStack {
          ScrollView {
              
              PhotosPicker(selection: $selectedItem) {
                  if let processedImage {
                      processedImage
                          .resizable()
                          .scaledToFit()
                  } else {
                      ContentUnavailableView(
                        "No Picture",
                        systemImage: "photo.badge.plus",
                        description: Text("Tap to import a photo")
                      )
                  }
              }
              .buttonStyle(.plain)
              .onChange(of: selectedItem, loadImage)
              
            VStack {
                FormTextFieldView(title: "Name", placeholder: "Enter name here", text: $catNameFieldText)
                FormTextEditorView(title: "Description", placeholder: "Any interesting details? Was it wearing a collar? What was it doing?", text: $catDescriptionFieldText)
            }
          }
            Button(action: {}, label: {
                Text("Save".uppercased())
                    .foregroundColor(Color(.white))
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(14)
        .navigationTitle("Add a cat")
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            await MainActor.run {
                processedImage = Image(uiImage: inputImage)
            }
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
