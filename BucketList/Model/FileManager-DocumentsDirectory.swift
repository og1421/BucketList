//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 01/01/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
