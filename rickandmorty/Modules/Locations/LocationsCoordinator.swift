//
//  LocationsCoordinator.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import UIKit

class LocationsCoordinator: BaseCoordinator<LocationsCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.locationsVC()
    }
}
