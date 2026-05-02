//
//  CatView.swift
//  CatSpotter
//
//  Created by David Glogowski on 02/05/2026.
//

import SwiftUI
import MapKit

struct CatView: View {
    
    let item: CatItemModel
    @ObservedObject var homeVM: HomeViewModel
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: item.latitude,
            longitude: item.longitude
        )
    }

    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
    @State private var camera: MapCameraPosition = .automatic

    
    
    var body: some View {

        

        let images = item.imageData.compactMap { UIImage(data: $0) }

        ScrollView {

            VStack(spacing: 0) {
                
                // IMAGE

                if let first = images.first {
                    Image(uiImage: first)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                }
                
                // CARD

                VStack(alignment: .leading, spacing: 12) {
                    
                    // CORE INFO & ACTIONS
                    HStack{
                        VStack (alignment: .leading){
                            Text(item.name)
                                .font(.title)
                                .fontWeight(.bold)
                            Label("6 sightings", systemImage: "binoculars.fill")
                        }
                        Spacer()
                        
                        Button {
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.primary)
                                .frame(width: 40, height: 40)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                        Button {
                        } label: {
                            Image(systemName: "heart")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.primary)
                                .frame(width: 40, height: 40)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                    }
                    
                    // NOTES & DESCRIPTION
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Sighter's Notes")
                                .font(.body)
                                .fontWeight(.bold)
                            Spacer()
                            Text("Yesterday")
                        }
                        Text(item.description)
                            .font(.body)
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    Spacer(minLength: 10)
                    
                    // MAP LOCATION
                    
                    VStack(alignment: .leading) {
                        
                        Text("Location")
                            .font(.body)
                            .fontWeight(.bold)
                        Map(

                            initialPosition: .region(

                                MKCoordinateRegion(

                                    center: CLLocationCoordinate2D(
                                        latitude: item.latitude,
                                        longitude: item.longitude
                                    ),
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                )
                            )
                        ) {
                            Marker(
                                item.name,
                                coordinate: CLLocationCoordinate2D(
                                    latitude: item.latitude,
                                    longitude: item.longitude
                                )
                            )
                        }
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    
                    

                }

                .padding()

                .frame(maxWidth: .infinity)

                .background(Color(.systemBackground))

                .clipShape(

                    RoundedRectangle(cornerRadius: 20, style: .continuous)

                )

                .offset(y: -30)

            }

        }

        .ignoresSafeArea(edges: .top)

    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = HomeViewModel()
        vm.items = DevData.items

        return NavigationView {
            CatView(
                item: DevData.items[0],
                homeVM: vm
            )
        }
    }
}
