//
//  DetailPresenter.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 15.01.2024.
//

import Foundation


final class DetailPresenter: DetailPresenterOutputProtocol {
    
    weak var view: DetailPresenterInputProtocol?
    let networkManager: NetworkManagerProtocol
    let poison: Poison?
    var router: RouterProtocol?
    
    required init(view: DetailPresenterInputProtocol, networkManager: NetworkManagerProtocol,
                  router: RouterProtocol, poison: Poison?)
    {
        self.view = view
        self.networkManager = networkManager
        self.poison = poison
        self.router = router
    }
    
    public func setPoison() {
        self.view?.setPoison(poison: poison)
    }
    
    public func returnToInitialViewController() {
        router?.popToRoot()
    }
}
