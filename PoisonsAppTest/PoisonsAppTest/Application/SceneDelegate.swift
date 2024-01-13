//
//  SceneDelegate.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        let searchController = SearchViewController()
        navController.viewControllers = [searchController]
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

