//
//  ViewController.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import UIKit

final class SearchViewController: BaseController {
    
    //MARK: - Properties
    private let searchBar = UISearchBar()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PoisonCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PoisonCollectionViewCell.self))
        return collectionView
    }()
    
   //MARK: - Search Button handler
    override func navBarRightButtonHandler() {
        search(shouldShow: true)
    }
    
    //MARK: - SearchBar Cancel Button handler
    private func search(shouldShow: Bool) {
        
        showSearchBarButton(shouldShow: !shouldShow)
        if shouldShow {
            searchBar.becomeFirstResponder()
            UIView.animate(withDuration: 0.3) {
                self.searchBar.alpha = 1.0
            }
        } else {
            self.searchBar.alpha = 0.0
            self.searchBar.text = ""
        }
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    //MARK: - Configure UI methods
    private func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            if let search = R.Images.searchImage {
                addNavBarButton(at: .right, with: search)
            }
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    private func configureSearchBar() {
        searchBar.alpha = 0.0
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.clearBackgroundColor()
        searchBar.textField?.backgroundColor = .systemBackground
    }
}

extension  SearchViewController {
    
    override func addViews() {
        super.addViews()
        view.addView(collectionView)
    }
    
    override func configureViews() {
        super.configureViews()
        
        if let back = R.Images.backArrow {
            addNavBarButton(at: .left, with: back)
        }
        configureSearchBar()
        showSearchBarButton(shouldShow: true)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
         
        ])
    }
}
    //MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
}
