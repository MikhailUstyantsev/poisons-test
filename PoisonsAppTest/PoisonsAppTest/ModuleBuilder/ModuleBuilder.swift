//
//  ModuleBuilder.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 14.01.2024.
//

import Foundation

import UIKit

protocol Builder {
    
    func createSearchScreen(router: RouterProtocol) -> UIViewController
}

final class ModuleBuilder: Builder {
    
    func createSearchScreen(router: RouterProtocol) -> UIViewController {
        let view = SearchViewController()
        let networkManager = NetworkManager()
        let presenter = SearchPresenter(
            view: view,
            networkManager: networkManager,
            router: router)
        view.presenter = presenter
        return view
    }
}
