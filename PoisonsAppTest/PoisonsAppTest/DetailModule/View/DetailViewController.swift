//
//  DetailViewController.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 15.01.2024.
//

import UIKit

final class DetailViewController: BaseController {
    
    //MARK: - Properties
    var presenter: DetailPresenterOutputProtocol?
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setPoison()
    }
    
    //MARK: - Back Button handler
    override func navBarLeftButtonHandler() {
        presenter?.returnToInitialViewController()
    }
}


extension DetailViewController: DetailPresenterInputProtocol {
    
    func setPoison(poison: Poison?) {
        if let poison = poison {
            detailView.configure(with: poison)
        }
    }
}


extension  DetailViewController {
    
    override func addViews() {
        super.addViews()
        view.addView(detailView)
    }
    
    override func configureViews() {
        super.configureViews()
        
        if let back = R.Images.backArrow {
            addNavBarButton(at: .left, with: back)
        }
    }
    
    override func constraintViews() {
        super.constraintViews()
        let margins = view.safeAreaLayoutGuide
        let topOffset: CGFloat = 24
        let sideOffset: CGFloat = 18
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: margins.topAnchor, constant: topOffset),
            detailView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: sideOffset),
            detailView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -sideOffset),
        ])
    }
}
