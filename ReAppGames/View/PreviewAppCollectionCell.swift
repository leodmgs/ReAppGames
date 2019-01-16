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
    
    private var startingScrollingOffset = CGPoint.zero
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
        
        addSubview(separatorLine)
        addSubview(sectionTitle)
        setupSeparatorLine()
        setupSectionTitleView()
        
        setCollectionViewConstraints(constantLeft: 0, constantTop: 0, constantRight: 0, constantBottom: 0, leftAnchor: self.leftAnchor, topAnchor: sectionTitle.bottomAnchor, rightAnchor: self.rightAnchor, bottomAnchor: self.bottomAnchor)
        
    }
    
    private func setupSeparatorLine() {
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        separatorLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
    }
    
    private func setupSectionTitleView() {
        sectionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        sectionTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        sectionTitle.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 9.7).isActive = true
        sectionTitle.heightAnchor.constraint(equalToConstant: 55).isActive = true
        sectionTitle.numberOfLines = 2
        sectionTitle.sizeToFit()
    }
    
}

extension PreviewAppCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
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
        return UIEdgeInsets(top: 10, left: 20, bottom: 25, right: 20)
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
