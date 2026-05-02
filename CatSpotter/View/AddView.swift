//
//  AddView.swift
//  CatSpotter
//
//  Created by David Glogowski on 01/05/2026.
//

import PhotosUI
import SwiftUI

@MainActor
struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = AddViewModel()
    
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        
        let images = vm.images
        
        VStack {
          ScrollView {
              
            PhotosPicker(
                  selection: $vm.selectedItems,
                  maxSelectionCount: 5,
                  matching: .images
            ) {
              if images.isEmpty {
                  ContentUnavailableView(
                      "Add Photos",
                      systemImage: "photo.on.rectangle.angled",
                      description: Text("Tap to add cat photos")
                  )
              } else {
                  ImageCarouselView(images: images.map { Image(uiImage: $0) })
              }
            }
            .buttonStyle(.plain)
              
            VStack {
                FormTextFieldView(title: "Name", placeholder: "Enter name here", text: $vm.name)
                FormTextEditorView(
                    title: "Description",
                    placeholder: "Any interesting details? Was it wearing a collar? What was it doing?",
                    text: $vm.description
                )
            }
          }
            Button(action: saveButtonPressed, label: {
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
    
    func saveButtonPressed() {
        let imagesDataArray = vm.images.compactMap {
            $0.jpegData(compressionQuality: 0.8)
        }
        homeVM.addItem(name: vm.name, description: vm.description, images: imagesDataArray)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView(homeVM: HomeViewModel())
        }
    }
}
