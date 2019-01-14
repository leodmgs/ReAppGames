//
//  DatasourceCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class DatasourceCell: UICollectionViewCell {
    
    var appDatasourceItem: Any?
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
    
    let sectionTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
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
        addSubview(separatorLine)
        
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
    }
    
    func setCollectionViewConstraints(constantLeft: CGFloat, constantTop: CGFloat, constantRight: CGFloat, constantBottom: CGFloat, leftAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, rightAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, bottomAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        
        appCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: constantTop).isActive = true
        appCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: constantLeft).isActive = true
        appCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: constantRight).isActive = true
        appCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: constantBottom).isActive = true
        
    }
    
}
