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
            sectionTitle.text = "New Year, New You:\nLimited-Time Offers"
        }
    }
    
    private var startingScrollingOffset = CGPoint.zero
    var groupedAppsDatasource: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(separatorLine)
        addSubview(sectionTitle)
        setupSeparatorLine()
        setupSectionTitleView()
        setupGroupedCollectionView()
    }
    
    private func setupSeparatorLine() {
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        separatorLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
    }
    
    private func setupSectionTitleView() {
        sectionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        sectionTitle.topAnchor.constraint(equalTo: self.separatorLine.bottomAnchor, constant: 10).isActive = true
        sectionTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        sectionTitle.numberOfLines = 2
    }
    
    private func setupGroupedCollectionView() {
        appCollectionView.register(GroupedAppCell.self, forCellWithReuseIdentifier: NSStringFromClass(GroupedAppCell.self))
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        setCollectionViewConstraints(constantLeft: 0, constantTop: 0, constantRight: 0, constantBottom: 0, leftAnchor: self.leftAnchor, topAnchor: sectionTitle.bottomAnchor, rightAnchor: self.rightAnchor, bottomAnchor: self.bottomAnchor)
    }
    
}

extension GroupedAppCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupedAppsDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let groupedCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GroupedAppCell.self), for: indexPath) as! GroupedAppCell
        let appName = groupedAppsDatasource[indexPath.item]
        let app = App(appName: appName, category: "Entertainment", price: 0.99, shortDescription: "An amazing App for you!")
        groupedCell.app = app
        groupedCell.separatorLine.isHidden = isLastCellAtColumn(collectionView, groupedCell, indexPath) ? true : false
        return groupedCell
    }
    
    func isLastCellAtColumn(_ collectionView: UICollectionView, _ cell: UICollectionViewCell, _ indexPath: IndexPath) -> Bool {
        let collectionHeight = collectionView.bounds.height - 40.0 // 40: collection view bottom padding
        let cellHeight = cell.bounds.height
        let cellIndex = CGFloat(indexPath.row + 1)
        let totalSpaceFilledEstimated = (cellIndex * cellHeight).truncatingRemainder(dividingBy: collectionHeight)
        // If it is possible to add a new cell to the current column (total space filled), it returns false, and true
        // if the next cell will be displayed in a new column.
        return (totalSpaceFilledEstimated + cellHeight) > collectionHeight
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let groupedViewWidth = UIScreen.main.bounds.width - 40
        let groupedViewHeight: CGFloat = 75
        return CGSize(width: groupedViewWidth, height: groupedViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 25, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(3)
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
