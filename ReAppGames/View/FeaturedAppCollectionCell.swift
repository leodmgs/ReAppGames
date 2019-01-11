//
//  FeaturedCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/9/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class FeaturedAppCollectionCell: DatasourceCell {
    
    override var appDatasourceItem: Any? {
        didSet {
            guard let featuredApps = appDatasourceItem as? [String] else { return }
            featuredAppsDatasource = featuredApps
        }
    }
    
    var featuredAppsDatasource: [String] = []
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        appCollectionView.register(FeaturedAppCell.self, forCellWithReuseIdentifier: NSStringFromClass(FeaturedAppCell.self))
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        
        addSubview(appNameLabel)
        
        appNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appNameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        appNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        appNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
    }
    
}


extension FeaturedAppCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredAppsDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let featuredAppCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCell.self), for: indexPath) as! FeaturedAppCell
        
        let appName = featuredAppsDatasource[indexPath.item]
        let app = App(appName: appName, category: "Limited time", price: 0, shortDescription: "Exclusive App Store offer")
        featuredAppCell.app = app
        
        return featuredAppCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let featuredViewWidth = UIScreen.main.bounds.width - 40
        let featuredViewHeight: CGFloat = 250
        return CGSize(width: featuredViewWidth, height: featuredViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
