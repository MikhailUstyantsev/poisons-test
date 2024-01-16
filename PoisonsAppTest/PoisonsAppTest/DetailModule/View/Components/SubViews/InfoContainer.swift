//
//  InfoContainer.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 17.01.2024.
//

import UIKit

final class InfoContainer: BaseView {
    
    //MARK: - Properties
    let titleLabel = UILabel()
    let descriptionView = UILabel()
    private let stackView = UIStackView()
    
    var poison: Poison? {
        didSet {
            titleLabel.text = poison?.name
            descriptionView.text = poison?.description
        }
    }
}

extension InfoContainer {
    
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        [titleLabel, descriptionView].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func constraintViews() {
        super.constraintViews()
        stackView.pinToSuperviewEdges()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        titleLabel.numberOfLines = 0
        titleLabel.font = R.Fonts.sanFranciscoDisplaySemibold(with: 20)
        
        descriptionView.font = R.Fonts.sanFranciscoDisplayRegular(with: 15)
        descriptionView.numberOfLines = 0
        descriptionView.isUserInteractionEnabled = false
        descriptionView.textColor = .label.withAlphaComponent(0.6)
        descriptionView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        
        stackView.axis = .vertical
        stackView.spacing = 15
    }
}
