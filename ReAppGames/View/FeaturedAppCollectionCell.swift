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
    
    private var startingScrollingOffset = CGPoint.zero
    var featuredAppsDatasource: [String] = []
    
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
        setCollectionViewConstraints(constantLeft: 0, constantTop: 15, constantRight: 0, constantBottom: 0, leftAnchor: self.leftAnchor, topAnchor: self.topAnchor, rightAnchor: self.rightAnchor, bottomAnchor: self.bottomAnchor)
    }
    
}


extension FeaturedAppCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

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
        return UIEdgeInsets(top: 0, left: 20, bottom: 75, right: 20)
    }
    
    //@FIXME
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingScrollingOffset = scrollView.contentOffset
    }
    
    //@FIXME
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellWidth = collectionView(
            appCollectionView,
            layout: appCollectionView.collectionViewLayout,
            sizeForItemAt: IndexPath(item: 0, section: 0)
            ).width
        
        let page: CGFloat
        let offset = scrollView.contentOffset.x + scrollView.contentInset.left
        let proposedPage = offset / max(1, cellWidth)
        let snapPoint: CGFloat = 0.1
        let snapDelta: CGFloat = offset > startingScrollingOffset.x ? (1 - snapPoint) : snapPoint
        
        if floor(proposedPage + snapDelta) == floor(proposedPage) {
            page = floor(proposedPage)
        }
        else {
            page = floor(proposedPage + 1)
        }
        
        targetContentOffset.pointee = CGPoint(
            x: (cellWidth * page) + (page * 10),
            y: targetContentOffset.pointee.y
        )
    }
    
}
