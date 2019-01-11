//
//  FeaturedAppCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class FeaturedAppCollectionCell: UICollectionViewCell {
    
    let appCellIdentifier = "app-cell-identifier"
    private var startingScrollingOffset = CGPoint.zero
    
    let appCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appCollectionView.register(AppCell.self, forCellWithReuseIdentifier: appCellIdentifier)
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(appCollectionView)
        
        appCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        appCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        appCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        appCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
//        appCollectionView.isPagingEnabled = true
        appCollectionView.showsHorizontalScrollIndicator = false
    }
    
}

// Extension to conform with UICollectionView protocols

extension FeaturedAppCollectionCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width - 40, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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

private class AppCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thumbnailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "asphalt-9")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: CGFloat(220.0/255), green: CGFloat(220.0/255), blue: CGFloat(220.0/255), alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let appCategory = "Limited time"
        let appName = "Asphalt 9 - Legends"
        let appPromo = "Exclusive App Store offer"
        titleLabel.attributedText = appTextInfoFormatted(category: appCategory, appName: appName, promo: appPromo)
        
        addSubview(separatorLine)
        addSubview(titleLabel)
        addSubview(thumbnailImage)
        
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        separatorLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 5).isActive = true
        
        thumbnailImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        thumbnailImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        thumbnailImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        thumbnailImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    private func appTextInfoFormatted(category: String, appName: String, promo: String = "") -> NSMutableAttributedString {
        let appCategoryLineBreak = "\(category.uppercased())\n"
        let systemDefaultBlueColor = UIColor(red: CGFloat(0.0), green: CGFloat(122.0/255), blue: CGFloat(1.0), alpha: 1)
        let attributedString = NSMutableAttributedString(string: appCategoryLineBreak, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: systemDefaultBlueColor])
        
        let appNameLineBreak = "\(appName)\n"
        attributedString.append(NSAttributedString(string: appNameLineBreak, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]))
        
        attributedString.append(NSAttributedString(string: promo, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))

        let paragraphLineSpaceStyle = NSMutableParagraphStyle()
        paragraphLineSpaceStyle.lineSpacing = 3
        let range = NSMakeRange(0, attributedString.string.count)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphLineSpaceStyle, range: range)

        return attributedString
    }
    
}
