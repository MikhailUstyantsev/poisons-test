//
//  DetailView.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 15.01.2024.
//

import UIKit

class DetailView: BaseView {
    
    private let imageContainer = ImageContainer(isLiked: false)
    private let infoContainer = InfoContainer()
    private let whereToBuyButton = UIButton()
    
    func configure(with item: Poison) {
        imageContainer.poison = item
        infoContainer.poison = item
    }
    
    private func setupBuyButton() {
        whereToBuyButton.setTitle(R.Strings.whereToBuyTitle, for: .normal)
        whereToBuyButton.titleLabel?.font = R.Fonts.sanFranciscoDisplaySemibold(with: 12)
        whereToBuyButton.setImage(R.Images.pin, for: .normal)
        whereToBuyButton.setTitleColor(.label, for: .normal)
        whereToBuyButton.backgroundColor = .systemBackground
        whereToBuyButton.layer.borderWidth = 0.3
        whereToBuyButton.layer.borderColor = UIColor.systemGray4.cgColor
        whereToBuyButton.layer.cornerRadius = 10
        whereToBuyButton.clipsToBounds = true
        let spacing: CGFloat = 8.0
        whereToBuyButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
    }
}

extension DetailView {
    
    override func setupViews() {
        super.setupViews()
        addView(imageContainer)
        addView(infoContainer)
        addView(whereToBuyButton)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 300),
            
            infoContainer.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 10),
            infoContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            whereToBuyButton.topAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 16),
            whereToBuyButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            whereToBuyButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            whereToBuyButton.heightAnchor.constraint(equalToConstant: 36),
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        setupBuyButton()
    }
}




