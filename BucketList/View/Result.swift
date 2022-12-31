//
//  Result.swift
//  BucketList
//
//  Created by Orlando Moraes Martins on 31/12/22.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageId: Int
    let title: String
    let terms: [String: [String]]?
}
