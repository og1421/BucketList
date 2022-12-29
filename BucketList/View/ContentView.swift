//
//  ContentView.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 29/12/22.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -15.893, longitude: -52.2599), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location (name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude:
        51.501, longitude: -0.141)),
        Location (name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude:
        51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        VStack{
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 44, height: 44)
                            
                            Text(location.name)
                        }
                    }
                }
            }
            .navigationTitle("Map Explorer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
