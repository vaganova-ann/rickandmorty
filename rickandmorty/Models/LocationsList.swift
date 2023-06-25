//
//  LocationsList.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import Foundation

struct LocationsList: Codable {

    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Location]
}
