//
//  FeaturedAppCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/11/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class FeaturedAppCell: UICollectionViewCell {
    
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
        let appCategory = "Limited time"
        let appName = "Asphalt 9 - Legends"
        let appPromo = "Exclusive App Store offer"
        titleLabel.attributedText = appTextInfoFormatted(category: appCategory, appName: appName, promo: appPromo)
        
        addSubview(separatorLine)
        addSubview(titleLabel)
        //addSubview(thumbnailImage)
        
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        separatorLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 5).isActive = true
        
//        thumbnailImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//        thumbnailImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
//        thumbnailImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        thumbnailImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
