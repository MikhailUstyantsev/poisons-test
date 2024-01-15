//
//  Router.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 14.01.2024.
//

import UIKit

protocol Router {
    var navigationController: UINavigationController? { get set }
    var builder: Builder? { get set }
}

protocol RouterProtocol: Router {
    
    func initialViewController()
    func showDetailViewController(poison: Poison?)
    func popToRoot()
}

final class AppRouter: RouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: Builder?
    
    init (navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let searchViewController = builder?.createSearchScreen(router: self) else { return }
            navigationController.viewControllers = [searchViewController]
        }
    }
    
    func showDetailViewController(poison: Poison?) {
        if let navigationController = navigationController {
            guard let detailViewController = builder?.createDetailScreen(router: self, poison: poison) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
