//
//  LocationApiClient.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import Foundation

protocol LocationsApiClient {
    func getLocations(page: Int, onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
    func getLocations(url: String, onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

extension ApiClient: LocationsApiClient {

    func getLocations(page: Int, onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.locationURL + "?page=\(page)"
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case let .success(list):
                onRequestCompleted(list, nil)
            case let .failure(error):
                onRequestCompleted(nil, error)
            }
        }
    }

    func getLocations(url: String, onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case let .success(list):
                onRequestCompleted(list, nil)
            case let .failure(error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
