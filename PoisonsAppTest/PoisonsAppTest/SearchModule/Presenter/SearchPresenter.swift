//
//  SearchPresenter.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 14.01.2024.
//

import Foundation

final class SearchPresenter: SearchPresenterOutputProtocol {
    
    var poisons: Poisons = []
    
    weak var view: SearchPresenterInputProtocol?
    let networkManager: NetworkManagerProtocol
    var router: RouterProtocol?
    
    init(view: SearchPresenterInputProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
    
    func loadPoisons() {
        view?.loader(show: true)
        networkManager.getPoisons { [weak self] poisons, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let poisons = poisons {
                    self.poisons = poisons
                    self.view?.poisonsLoaded(poisons: poisons)
                } else if let error = error {
                    self.view?.showErrorAlert()
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func loadMorePoisons() {
        //в настоящий момент API не поддерживает пагинацию - при смене offset приходят те же данные
    }
    
    func tapOnPoison(poison: Poison?) {
        router?.showDetailViewController(poison: poison)
    }
}
