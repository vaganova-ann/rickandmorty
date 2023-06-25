//
//  LocationsAssembly.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import Foundation

protocol LocationsAssembly {
    func locationsCoordinator() -> LocationsCoordinator
    func locationsVC() -> LocationsViewController<LocationsViewImp>
    func locationsDataProvider() -> LocationsDataProvider
}

extension Assembly: LocationsAssembly {

    func locationsCoordinator() -> LocationsCoordinator {
        LocationsCoordinator(assembly: self, context: .init())
    }

    func locationsVC() -> LocationsViewController<LocationsViewImp> {
        .init(dataProvider: locationsDataProvider())
    }

    func locationsDataProvider() -> LocationsDataProvider {
        LocationsDataProviderImp(apiClient: apiClient)
    }
}
