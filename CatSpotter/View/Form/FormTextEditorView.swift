//
//  FormTextEditorView.swift
//  CatSpotter
//
//  Created by David Glogowski on 01/05/2026.
//

import SwiftUI

struct FormTextEditorView: View {
    
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
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color(.placeholderText))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 12)
                }
                TextEditor(text: $text)
                    .padding(8)
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
            }
            .frame(height: 120)
            .background(Color(.systemGray6))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4))
            )
            .cornerRadius(8)
        }
    }
}


struct FormTextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FormTextEditorView(title: "Description", text: .constant("Some Description"))
            .padding(14)
    }
}
