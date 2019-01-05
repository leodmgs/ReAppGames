//
//  HomeAppViewController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class HomeAppViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let genericAppCellIdentifier = "generic-app-cell"
    private let appHeaderCellIdentifier = "app-header-cell-identifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.register(GenericAppHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: appHeaderCellIdentifier)
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
        collectionView.register(FeaturedAppCell.self, forCellWithReuseIdentifier: genericAppCellIdentifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.isTranslucent = false
        navBar.tintColor = .white
        navigationItem.title = "Apps"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let featuredAppCell = collectionView.dequeueReusableCell(withReuseIdentifier: genericAppCellIdentifier, for: indexPath)
        return featuredAppCell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 320)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: appHeaderCellIdentifier, for: indexPath)
            return header
        }
        fatalError("View for supplementary element was not defined")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 60)
    }
    
}
