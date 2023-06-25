//
//  NetworkConstants.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import Foundation

struct NetworkConstants {

    struct URLStrings {
        static let locationURL = "https://rickandmortyapi.com/api/location"
        static let characterURL = "https://rickandmortyapi.com/api/character"
    }

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
    }
}
