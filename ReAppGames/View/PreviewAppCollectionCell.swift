//
//  PreviewCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class PreviewAppCollectionCell: DatasourceCell {
    
    override var appDatasourceItem: Any? {
        didSet {
            //@FIXME
            guard let apps = appDatasourceItem as? [String] else { return }
            previewAppsCollection = apps
            sectionTitle.text = "Get Productive: 50% off with this offer"
        }
    }
    
    var previewAppsCollection: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        appCollectionView.register(PreviewAppCell.self, forCellWithReuseIdentifier: NSStringFromClass(PreviewAppCell.self))
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        
        addSubview(sectionTitle)
        sectionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        sectionTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        sectionTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        sectionTitle.heightAnchor.constraint(equalToConstant: 55).isActive = true
        sectionTitle.numberOfLines = 2
        sectionTitle.sizeToFit()
        
        setCollectionViewConstraints(constantLeft: 0, constantTop: 0, constantRight: 0, constantBottom: 0, leftAnchor: self.leftAnchor, topAnchor: sectionTitle.bottomAnchor, rightAnchor: self.rightAnchor, bottomAnchor: self.bottomAnchor)
        
    }
    
}

extension PreviewAppCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let previewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(PreviewAppCell.self), for: indexPath) as! PreviewAppCell
        let app = App(appName: previewAppsCollection[indexPath.row], category: "Education", price: 0)
        previewCell.app = app
        return previewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.previewAppsCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width - 40
        let cellHeight: CGFloat = 350
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
