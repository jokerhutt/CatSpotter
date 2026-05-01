//
//  ImageCarouselView.swift
//  CatSpotter
//
//  Created by David Glogowski on 02/05/2026.
//

import SwiftUI

struct ImageCarouselView: View {
    
    let images: [Image]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            TabView {
                ForEach(Array(images.enumerated()), id: \.offset) { _, image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 260)
                        .clipped()
                }
            }
            .tabViewStyle(.page)
            .frame(height: 260)
            
            if images.count > 0 {
                Text("\(images.count)")
                    .font(.subheadline.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(12)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ImageCarouselView_Previews: PreviewProvider {

    static var previews: some View {

        ImageCarouselView(

            images: [

                Image(systemName: "cat"),

                Image(systemName: "photo"),

                Image(systemName: "hare")

            ]

        )

        .padding()

        .previewLayout(.sizeThatFits)

    }

}
