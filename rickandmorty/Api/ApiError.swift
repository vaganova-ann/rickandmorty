//
//  ApiError.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import Foundation

enum ApiError: Error {

    case dataParsing
    case serverError
    case `default`(Data?)

    var rawValue: String {
        switch self {
        case .dataParsing:
            return L10n.ApiError.parsing
        case .serverError:
            return L10n.ApiError.server
        case let .default(error):
            if let error {
                return String(decoding: error, as: UTF8.self)
            } else {
                return L10n.ApiError.unknown
            }
        }
    }
}
