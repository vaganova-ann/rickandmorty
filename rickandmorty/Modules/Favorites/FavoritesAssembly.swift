//
//  FavoritesAssembly.swift
//  rickandmorty
//
//  Created by Анна on 25.06.2023.
//

import Foundation

protocol FavoritesAssembly {
    func favoritesCoordinator() -> FavoritesCoordinator
    func favoritesVC() -> FavoritesViewController
}

extension Assembly: FavoritesAssembly {

    func favoritesCoordinator() -> FavoritesCoordinator {
        .init(assembly: self, context: .init())
    }

    func favoritesVC() -> FavoritesViewController {
        .init()
    }
}
