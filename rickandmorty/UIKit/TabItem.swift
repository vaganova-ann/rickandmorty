//
//  TabItem.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import UIKit

enum TabItem: Int {
    case locations = 0
    case favorites

    var tabBarItem: UITabBarItem {
        let tabBarItem = UITabBarItem(
            title: title,
            image: image,
            tag: self.rawValue
        )
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 10)
        ]
        tabBarItem.standardAppearance = appearance
        return tabBarItem
    }

    private var title: String? {
        switch self {
        case .locations:
            return L10n.Tabbar.locations
        case .favorites:
            return L10n.Tabbar.favorites
        }
    }

    private var image: UIImage? {
        switch self {
        case .locations:
            return UIImage(systemName: "globe")
        case .favorites:
            return UIImage(systemName: "star")
        }
    }
}
