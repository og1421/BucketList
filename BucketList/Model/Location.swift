//
//  Location.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 30/12/22.
//

import MapKit
import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var decription: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
