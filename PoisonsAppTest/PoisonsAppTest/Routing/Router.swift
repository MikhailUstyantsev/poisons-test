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
}
