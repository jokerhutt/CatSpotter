//
//  HomeView.swift
//  CatSpotter
//
//  Created by David Glogowski on 30/04/2026.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var vm = HomeViewModel()

    var body: some View {
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(vm.items) { item in
                        NavigationLink {
                            CatView(item: item, homeVM: vm)
                        } label: {
                            GridCardItemView(item: item)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Your Cats")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView(homeVM: vm))
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
   


