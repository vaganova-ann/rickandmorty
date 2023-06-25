//
//  SceneDelegate.swift
//  rickandmorty
//
//  Created by Анна on 15.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private lazy var launchCoordinator: LaunchCoordinator? = {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.assembly.appCoordinator()
        }
        return nil
    }()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        launchCoordinator?.start(window: window)
    }
}
