//
//  SearchPresenterIO.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 14.01.2024.
//

import Foundation

//view conforms Input

protocol SearchPresenterOutputProtocol: AnyObject {
    
    init(view: SearchPresenterInputProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
    func loadPoisons()
    func loadMorePoisons()
    func tapOnPoison(poison: Poison?)
    var poisons: Poisons { get set }
}

protocol SearchPresenterInputProtocol: AnyObject {
    
    func poisonsLoaded(poisons: Poisons)
    func loader(show: Bool)
    func showErrorAlert()
}
