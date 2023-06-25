//
//  LocationsDataProvider.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import Foundation

protocol LocationsDataProvider {
    func locations(page: Int, completion: @escaping (LocationsList?, ApiError?) -> Void)
    func locations(url: String, completion: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationsDataProviderImp: LocationsDataProvider {

    private let apiClient: LocationsApiClient

    init(apiClient: LocationsApiClient) {
        self.apiClient = apiClient
    }

    func locations(page: Int, completion: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.getLocations(page: page) { list, error in
            completion(list, error)
        }
    }

    func locations(url: String, completion: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.getLocations(url: url) { list, error in
            completion(list, error)
        }
    }
}
