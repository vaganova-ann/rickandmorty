//
//  Location.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
}
