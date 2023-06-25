//
//  LaunchCoordinator.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import UIKit

struct CoordinatorContext {}

class LaunchCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?
    private weak var tabBarController: UITabBarController?

    func start(window: UIWindow) {
        self.window = window
        setTabVC()
    }

    private func setTabVC() {
        let tabVC = assembly.rootTabBarController()

        let locationsCoord = assembly.locationsCoordinator()
        let favoritesCoord = assembly.favoritesCoordinator()
        guard let locationsVC = locationsCoord.make(), let favoritesVC = favoritesCoord.make() else {
            return
        }
        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationsVC], animated: false)
        navVC.tabBarItem = TabItem.locations.tabBarItem

        favoritesVC.tabBarItem = TabItem.favorites.tabBarItem
        tabVC.setViewControllers([navVC, favoritesVC], animated: false)
        setRoot(viewController: tabVC)
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
