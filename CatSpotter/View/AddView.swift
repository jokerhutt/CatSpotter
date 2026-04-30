//
//  AddView.swift
//  CatSpotter
//
//  Created by David Glogowski on 01/05/2026.
//

import SwiftUI

struct AddView: View {
    
    @State var catNameFieldText: String = ""
    @State var catDescriptionFieldText: String = ""
    
    var body: some View {
        VStack {
          ScrollView {
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
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
