//
//  FavoritesCoordinator.swift
//  rickandmorty
//
//  Created by Анна on 25.06.2023.
//

import UIKit

class FavoritesCoordinator: BaseCoordinator<FavoritesCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.favoritesVC()
    }
}
