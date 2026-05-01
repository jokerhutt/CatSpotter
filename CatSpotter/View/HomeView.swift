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
            ),
            CatItemModel(
                name: "Ocelot Cat!",
                imageUrl: "https://i.redd.it/show-me-your-silly-cats-v0-wplu39sp6l1d1.jpg?width=4032&format=pjpg&auto=webp&s=9970c7152419d80629bc8a7e94ea556b9779f833"
            ),
            CatItemModel(
                name: "Doorbell Cat!",
                imageUrl: "https://i.pinimg.com/236x/4b/6e/92/4b6e928711121c8827bc112591969fdc.jpg"
            ),
            CatItemModel(
                name: "Polite cat",
                imageUrl: "https://i.pinimg.com/736x/e3/24/f7/e324f790cfe0a51d76f98356475cc408.jpg"
            ),
            CatItemModel(
                name: "Mwehehe Cat",
                imageUrl: "https://media.tenor.com/uKayqry3x90AAAAM/goofy-funny-cat.gif"
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
        .navigationTitle("Your Cats")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
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


