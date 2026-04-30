//
//  HomeView.swift
//  CatSpotter
//
//  Created by David Glogowski on 30/04/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        let items : [CatItemModel] = [
            CatItemModel(
                name: "Tabby Cat", imageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfueyew2yETRQjHKrFZ9wv79Of9mzoranwlw&s"
            ),
            CatItemModel(
                name: "Silliest Cat!",
                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQssdL0Yty9vYW-vjEzZqg2QbVSKFVrq3wLGA&s"
            )
        ]
        
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(items) { item in
                        GridCardItemView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}


