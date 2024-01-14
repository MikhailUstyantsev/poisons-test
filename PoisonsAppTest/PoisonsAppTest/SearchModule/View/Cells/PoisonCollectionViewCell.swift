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
    let descriptionLabel = UILabel()
    
    var poison: Poison? {
      didSet {
          titleLabel.text = poison?.name
          descriptionLabel.text = poison?.description
          let urlString = "http://shans.d2.i-partner.ru" + (poison?.image ?? "")
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
        descriptionLabel.text = nil
    }
}

extension PoisonCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
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
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset)
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .clear
        contentView.backgroundColor = .systemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        [titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
        }
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
}
