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
        window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController()
        let moduleBuilder = ModuleBuilder()
        let router = AppRouter(
            navigationController: navController,
            builder: moduleBuilder
        )
        router.initialViewController()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

