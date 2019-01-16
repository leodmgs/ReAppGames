//
//  AppDatasourceController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class AppDatasourceController: UICollectionViewController {

    
    let displayAppsByCategoryOrder = ["Header", "Featured", "Grouped", "Preview", "Preview"]
    let separatorLineNavBarLayer = CALayer()
    
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
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: NSStringFromClass(HeaderCell.self))
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
            let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HeaderCell.self), for: indexPath) as! HeaderCell
            headerCell.titleLabel.text = "Apps"
            return headerCell
        case 1:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCollectionCell.self), for: indexPath) as! FeaturedAppCollectionCell
        case 2:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GroupedAppCollectionCell.self), for: indexPath) as! GroupedAppCollectionCell
        case 3:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(PreviewAppCollectionCell.self), for: indexPath) as! PreviewAppCollectionCell
        default:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(DefaultAppCollectionCell.self), for: indexPath) as! DefaultAppCollectionCell
            if let cell = collectionCell as? DefaultAppCollectionCell {
                cell.defaultTextLabel.text = "Content not available!"
            }
        }
        
        collectionCell.controller = self
        if let dataItem = datasource?.item(indexPath) {
            collectionCell.appDatasourceItem = dataItem
        }
        return collectionCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width
        var collectionViewHeight: CGFloat = 200 // Default cell height
        
        if indexPath.section == 0 { // Header cell at the top
            collectionViewHeight = 45
        } else if indexPath.section == 1 { // Featured section
            collectionViewHeight = 330
        } else if indexPath.section == 2 { // Grouped Section
            collectionViewHeight = 330
        } else if indexPath.section == 3 { // Preview Section
            collectionViewHeight = 420
        }
        
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            disableNavBarViews()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            enableNavBarViews()
        }
    }
    
}
