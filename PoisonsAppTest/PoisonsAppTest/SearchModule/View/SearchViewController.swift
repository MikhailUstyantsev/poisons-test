//
//  ViewController.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import UIKit
import JGProgressHUD

final class SearchViewController: BaseController {
    
    enum Section {
        case main
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Poison>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Poison>
    
    //MARK: - Properties
    private let searchBar = UISearchBar()
    var presenter: SearchPresenterOutputProtocol?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var collectionDataSource = makeDataSource()
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPoisons()
    }
    
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
        searchBar.placeholder = R.Strings.searchTextFieldPlaceholder
        searchBar.clearBackgroundColor()
        searchBar.textField?.backgroundColor = .systemBackground
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.register(PoisonCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PoisonCollectionViewCell.self))
    }
    
    // MARK: - DataSource methods
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, poison) ->
                UICollectionViewCell? in
                
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: String(describing: PoisonCollectionViewCell.self),
                    for: indexPath) as? PoisonCollectionViewCell
                cell?.poison = poison
                return cell
            })
        return dataSource
    }
    
    private func applySnapshot(with poisons: Poisons, animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(poisons)
        collectionDataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    // MARK: - SearchBar filtering methods    
    private func filteredPoisons(with filter: String?) -> Poisons {
        return presenter?.poisons.filter { $0.contains(filter) } ?? []
    }
    
    private func performQuery(with filter: String?) {
        let poisons = filteredPoisons(with: filter).sorted { $0.name < $1.name }
        applySnapshot(with: poisons)
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
        configureCollectionView()
        showSearchBarButton(shouldShow: true)
    }
    
    override func constraintViews() {
        super.constraintViews()
        let margins = view.safeAreaLayoutGuide
        let topOffset: CGFloat = 24
        let sideOffset: CGFloat = 16
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: margins.topAnchor, constant: topOffset),
            collectionView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: sideOffset),
            collectionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -sideOffset),
        ])
    }
}
//MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performQuery(with: searchText)
    }
}


extension SearchViewController: SearchPresenterInputProtocol {
    
    func poisonsLoaded(poisons: Poisons) {
        applySnapshot(with: poisons)
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.textLabel.text = R.Strings.done
        hud.detailTextLabel.text = nil
        hud.dismiss(afterDelay: 1)
    }
    
    func loader(show: Bool) {
        if show {
            hud.textLabel.text = R.Strings.loading
            hud.detailTextLabel.text = R.Strings.waitABit
            hud.show(in: view)
        }
    }
    
    func showErrorAlert() {
        self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
        self.hud.textLabel.text = R.Strings.error
        self.hud.detailTextLabel.text = nil
        self.hud.dismiss(afterDelay: 1)
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let poison = collectionDataSource.itemIdentifier(for: indexPath) else { return }
        presenter?.tapOnPoison(poison: poison)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 47) / 2, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
