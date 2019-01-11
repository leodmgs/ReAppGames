//
//  DatasourceCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class DatasourceCell: UICollectionViewCell {
    
    var dataItem: Any?
    weak var controller: AppDatasourceController?
    
    let appCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setupViews() {
        addSubview(appCollectionView)
        appCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        appCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        appCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        appCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
}
