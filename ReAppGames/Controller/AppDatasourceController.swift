//
//  AppDatasourceController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class AppDatasourceController: UICollectionViewController {

    
    let displayAppsByCategoryOrder = ["Featured", "Grouped", "Preview"]
    
    var datasource: Datasource? {
        didSet {
            if let cellClasses = datasource?.cellClasses() {
                for cellClass in cellClasses {
                    collectionView.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
                }
            }
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = AppDatasource()
        setupViews()
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
    }
    
}


extension AppDatasourceController: UICollectionViewDelegateFlowLayout {
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayAppsByCategoryOrder.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 1 represents a single cell that contains the collection view to display the App list
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var collectionCell: DatasourceCell
        
        switch indexPath.section {
        case 0:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCollectionCell.self), for: indexPath) as! FeaturedAppCollectionCell
        case 1:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GroupedAppCollectionCell.self), for: indexPath) as! GroupedAppCollectionCell
        default:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(DefaultAppCollectionCell.self), for: indexPath) as! DefaultAppCollectionCell
            if let cell = collectionCell as? DefaultAppCollectionCell {
                cell.defaultTextLabel.text = "Content not available!"
            }
        }
        
        collectionCell.controller = self
        collectionCell.appDatasourceItem = datasource?.item(indexPath)
        
        return collectionCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width
        let collectionViewHeight: CGFloat = 350
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
}
