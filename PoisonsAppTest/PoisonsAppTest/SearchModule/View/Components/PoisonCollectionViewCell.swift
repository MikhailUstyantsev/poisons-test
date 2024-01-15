//
//  PoisonCollectionViewCell.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import UIKit
import JGProgressHUD
import Kingfisher

final class PoisonCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionView = UITextView()
    
    var poison: Poison? {
      didSet {
          titleLabel.text = poison?.name.uppercased()
          descriptionView.text = poison?.description
          let urlString = R.Strings.shansBaseURL + (poison?.image ?? "")
          guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
              return
          }
          imageView.kf.setImage(with: url)
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureAppearance()
        constraintViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        descriptionView.text = nil
    }
}

extension PoisonCollectionViewCell {
    
    func setupViews() {
        contentView.addView(imageView)
        contentView.addView(titleLabel)
        contentView.addView(descriptionView)
    }
    
    func constraintViews() {
        let offset: CGFloat = 12
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offset),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),
            imageView.heightAnchor.constraint(equalToConstant: 82),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: offset),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            descriptionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset)
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .clear
        contentView.backgroundColor = .systemBackground
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        titleLabel.numberOfLines = 0
        titleLabel.font = R.Fonts.sanFranciscoDisplaySemibold(with: 13)
        
        descriptionView.font = R.Fonts.sanFranciscoDisplayRegular(with: 12)
        descriptionView.isEditable = false
        descriptionView.isUserInteractionEnabled = false
        descriptionView.textColor = .label.withAlphaComponent(0.6)
        descriptionView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        descriptionView.textContainer.lineFragmentPadding = 0
        descriptionView.textContainerInset = .zero
    }
}
