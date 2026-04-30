//
//  FormTextAreaView.swift
//  CatSpotter
//
//  Created by David Glogowski on 01/05/2026.
//

import SwiftUI

struct FormTextFieldView: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    init(title: String, placeholder: String = "", text: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
            TextField(placeholder, text: $text)
                .padding(10)
                .background(Color(.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.4))
                )
                .cornerRadius(8)
        }
    }
}


struct FormTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormTextFieldView(title: "Description", text: .constant("Some Description"))
            .padding(14)
    }
}


