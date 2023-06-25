//
//  Assembly.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import UIKit

class Assembly {

    var apiClient: ApiClient {
        ApiClient()
    }

    func appCoordinator() -> LaunchCoordinator {
        LaunchCoordinator(assembly: self, context: .init())
    }

    func rootTabBarController() -> UITabBarController {
        TabBarController()
    }

    func rootNavigationController() -> UINavigationController {
        let controller = BaseNavigationController()
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
