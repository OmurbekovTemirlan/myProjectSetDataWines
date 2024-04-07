//
//  Wine.swift
//  myProject
//
//  Created by Apple on 7.4.2024.
//

import Foundation

// Encodable - co SWift v JASON (JavaScript OObjaction Notation)
// Decodable - c Jason to SWift
//Codable - all

struct Wine: Decodable {
    let winery: String
    let wine: String
    let rating: Rating
    let location: String
    let image: String
    let id: String
}

struct Rating: Decodable {
    let average: String
    let reviews: String
}
