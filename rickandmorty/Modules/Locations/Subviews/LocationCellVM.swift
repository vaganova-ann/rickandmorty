//
//  LocationCellVM.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import Foundation

struct LocationCellVM {
    let title: String
    let population: String
    let residents: [String]

    init(location: Location) {
        title = location.name
        population = L10n.Locations.population(location.residents.count)
        residents = location.residents
    }
}
