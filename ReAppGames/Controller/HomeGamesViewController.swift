//
//  HomeGamesViewController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class HomeGamesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let genericGameCellIdentifier = "generic-game-cell"
    private let gameHeaderCellIdentifier = "game-header-cell-identifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.register(GenericGameHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: gameHeaderCellIdentifier)
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
        collectionView.register(FeaturedGameCell.self, forCellWithReuseIdentifier: genericGameCellIdentifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.isTranslucent = false
        navBar.tintColor = .white
        navigationItem.title = "Games"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let featuredGameCell = collectionView.dequeueReusableCell(withReuseIdentifier: genericGameCellIdentifier, for: indexPath)
        return featuredGameCell
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
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: gameHeaderCellIdentifier, for: indexPath)
            return header
        }
        fatalError("View for supplementary element was not defined")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 60)
    }
    
}
