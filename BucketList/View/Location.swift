//
//  Location.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 30/12/22.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var decription: String
    let latitude: Double
    let longitude: Double
    
    
}
