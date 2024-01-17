//
//  ImageContainer.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 16.01.2024.
//

import UIKit
import Kingfisher

final class ImageContainer: BaseView {
    
    //MARK: - Properties
    private var isLiked: Bool {
        didSet {
            if isLiked {
                likeButton.setImage(R.Images.like, for: .normal)
            } else {
                likeButton.setImage(R.Images.dislike, for: .normal)
            }
        }
    }
    
    private let iconImageView = UIImageView()
    private let poisonImageView = UIImageView()
    private let likeButton = UIButton()
    private let stackView = UIStackView()
    
    var poison: Poison? {
        didSet {
            let iconURLString = R.Strings.shansBaseURL + (poison?.categories.icon ?? "")
            let poisonImageURLString = R.Strings.shansBaseURL + (poison?.image ?? "")
            
            guard let iconUrl = URL(string: iconURLString), let poisonImageUrl = URL(string: poisonImageURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
                return
            }
            iconImageView.kf.setImage(with: iconUrl)
            poisonImageView.kf.setImage(with: poisonImageUrl)
        }
    }
    
    init(isLiked: Bool, poison: Poison? = nil) {
        self.isLiked = isLiked
        self.poison = poison
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Like Button handler
    @objc private func likeButtonTapped() {
        isLiked = !isLiked
    }
}

extension ImageContainer {
    
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        [iconImageView, poisonImageView, likeButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        [iconImageView, poisonImageView].forEach {
            $0.contentMode = .scaleAspectFit
        }
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
    }
    
    override func constraintViews() {
        super.constraintViews()
        stackView.pinToSuperviewEdges(constant: 10)
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 32),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            likeButton.widthAnchor.constraint(equalToConstant: 28),
            likeButton.heightAnchor.constraint(equalTo: likeButton.widthAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        iconImageView.layer.cornerRadius = iconImageView.layer.bounds.width / 2
        iconImageView.clipsToBounds = true
        isLiked = false
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
}
