//
//  HomeAppViewController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit



class AppViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let genericAppCellIdentifier = "generic-app-cell"
    private let appHeaderCellIdentifier = "app-header-cell-identifier"
    private let separatorLineNavBarLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: appHeaderCellIdentifier)
        collectionView.register(FeaturedAppCollectionCell.self, forCellWithReuseIdentifier: genericAppCellIdentifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.isTranslucent = false
        navBar.tintColor = .white
        
        let screenWidth = UIScreen.main.bounds.width
        let navHeightSize = navBar.layer.bounds.height

        separatorLineNavBarLayer.bounds = CGRect(x: 0, y: 0, width: screenWidth, height: 0.5)
        separatorLineNavBarLayer.backgroundColor = UIColor.white.cgColor
        separatorLineNavBarLayer.anchorPoint = CGPoint(x: 0, y: 0)
        separatorLineNavBarLayer.position = CGPoint(x: 0, y: navHeightSize)

        navBar.layer.addSublayer(separatorLineNavBarLayer)
        
        let titleNavBar = UILabel()
        titleNavBar.text = "Apps"
        titleNavBar.font = UIFont.boldSystemFont(ofSize: 16)
        
        navigationItem.titleView = titleNavBar
        navigationItem.titleView?.alpha = 0
        
    }
    
    private func enableNavBarViews() {
        UIView.animate(withDuration: 0.2, animations: {
            self.navigationItem.titleView?.alpha = 1
        })
        self.separatorLineNavBarLayer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    private func disableNavBarViews() {
        UIView.animate(withDuration: 0.2, animations: {
            self.navigationItem.titleView?.alpha = 0
        })
        self.separatorLineNavBarLayer.backgroundColor = UIColor.white.cgColor
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let featuredAppCell = collectionView.dequeueReusableCell(withReuseIdentifier: genericAppCellIdentifier, for: indexPath)
        return featuredAppCell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
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
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        enableNavBarViews()
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
        disableNavBarViews()
    }
    
}
