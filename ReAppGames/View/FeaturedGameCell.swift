//
//  FeaturedGameCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class FeaturedGameCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let gameCellIdentifier = "game-cell-identifier"
    
    let gamesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gamesCollectionView.register(GameCell.self, forCellWithReuseIdentifier: gameCellIdentifier)
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(gamesCollectionView)
        gamesCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        gamesCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        gamesCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        gamesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        gamesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        //gamesCollectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: gameCellIdentifier, for: indexPath)
        return gameCell
    }
    
}

private class GameCell: UICollectionViewCell {
    
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
        
        let gameCategory = "Limited time"
        let gameName = "Asphalt 9 - Legends"
        let gamePromo = "Exclusive App Store offer"
        titleLabel.attributedText = gameInfoTextFormatted(category: gameCategory, nameOfGame: gameName, promo: gamePromo)
        
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
    
    private func gameInfoTextFormatted(category: String, nameOfGame: String, promo: String = "") -> NSMutableAttributedString {
        let gameCategoryLineBreak = "\(category.uppercased())\n"
        let systemDefaultBlueColor = UIColor(red: CGFloat(0.0), green: CGFloat(122.0/255), blue: CGFloat(1.0), alpha: 1)
        let attributedString = NSMutableAttributedString(string: gameCategoryLineBreak, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: systemDefaultBlueColor])
        
        let gameNameLineBreak = "\(nameOfGame)\n"
        attributedString.append(NSAttributedString(string: gameNameLineBreak, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]))
        
        attributedString.append(NSAttributedString(string: promo, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))

        let paragraphLineSpaceStyle = NSMutableParagraphStyle()
        paragraphLineSpaceStyle.lineSpacing = 3
        let range = NSMakeRange(0, attributedString.string.count)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphLineSpaceStyle, range: range)

        return attributedString
    }
    
}
