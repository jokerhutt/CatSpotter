//
//  ItemView.swift
//  CatSpotter
//
//  Created by David Glogowski on 30/04/2026.
//

import SwiftUI



struct GridCardItemView: View {
    
    let item: CatItemModel

    var body: some View {
        
        VStack(alignment: .leading, spacing: 16.0) {
            if let data = item.imageData.first,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: .infinity, height: 200)
            } else {
                Color.gray.opacity(0.2)
                    .frame(width: .infinity, height: 200)
            }
            cardText.padding(.horizontal, 8)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24.0))
        .shadow(radius: 8)
        
    }
    
    var cardText: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
            HStack(spacing: 4.0) {
                Image(systemName: "clock.arrow.circlepath")
                Text("Last spotted 10 min ago")
            }.foregroundColor(.gray)
            .padding(.bottom, 16)
        }
    }


}

struct GridCardItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridCardItemView(item: DevData.items[0])
    }
}
