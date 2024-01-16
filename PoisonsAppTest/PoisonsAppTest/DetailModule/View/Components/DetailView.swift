//
//  DetailView.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 15.01.2024.
//

import UIKit

class DetailView: BaseView {
  
    private let imageContainer = ImageContainer()
    private let infoContainer = InfoContainer()
    
    func configure(with item: Poison) {
        imageContainer.poison = item
        infoContainer.poison = item
    }
}

extension DetailView {
    
    override func setupViews() {
        super.setupViews()
        addView(imageContainer)
        addView(infoContainer)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 200),
            
            infoContainer.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 10),
            infoContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    
    }
}




