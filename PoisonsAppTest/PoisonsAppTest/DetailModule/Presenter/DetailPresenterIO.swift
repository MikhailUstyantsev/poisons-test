//
//  DetailPresenterIO.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 15.01.2024.
//

import Foundation

protocol DetailPresenterOutputProtocol: AnyObject {
    
    init(view: DetailPresenterInputProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, poison: Poison?)
    func setPoison()
    func returnToInitialViewController()
}

protocol DetailPresenterInputProtocol: AnyObject {
    
    func setPoison(poison: Poison?)
}



