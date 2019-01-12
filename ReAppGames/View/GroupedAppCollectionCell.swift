//
//  GroupedCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/9/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class GroupedAppCollectionCell: DatasourceCell {
    
    override var appDatasourceItem: Any? {
        didSet {
            guard let apps = appDatasourceItem as? [String] else { return }
            groupedAppsDatasource = apps
            sectionTitle.text = "New Year, New You:\nLimited-Time Offers:"
        }
    }
    
    var groupedAppsDatasource: [String] = []
    
    let sectionTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.backgroundColor = .cyan
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
        
        addSubview(sectionTitle)
        
        sectionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        sectionTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        appCollectionView.register(GroupedAppCell.self, forCellWithReuseIdentifier: NSStringFromClass(GroupedAppCell.self))
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        
        setCollectionViewConstraints(constantLeft: 0, constantTop: 0, constantRight: 0, constantBottom: 0, leftAnchor: self.leftAnchor, topAnchor: sectionTitle.bottomAnchor, rightAnchor: self.rightAnchor, bottomAnchor: self.bottomAnchor)
        
    }
    
}

extension GroupedAppCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupedAppsDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let groupedCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GroupedAppCell.self), for: indexPath) as! GroupedAppCell
        
        let appName = groupedAppsDatasource[indexPath.item]
        let app = App(appName: appName, category: "Entertainment", price: 0.99, shortDescription: "An amazing App for you!")
        groupedCell.app = app
        
        return groupedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let groupedViewWidth = UIScreen.main.bounds.width - 40
        let groupedViewHeight: CGFloat = 70
        return CGSize(width: groupedViewWidth, height: groupedViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 0, right: -20)
    }
    
}
