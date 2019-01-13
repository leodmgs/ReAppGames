//
//  PreviewAppCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/13/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class PreviewAppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            guard let appObject = app else { return }
            appNameCategory.attributedText = attributedAppNameAndCategory(name: appObject.name, category: appObject.category)
        }
    }
    
    let appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .magenta
        return imageView
    }()
    
    let appNameCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "App Name"
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    let purchasesTextFlag: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.lightGray
        label.text = "In-App Purchases"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .yellow
        
        addSubview(appIcon)
        addSubview(appNameCategory)
        addSubview(actionButton)
        addSubview(purchasesTextFlag)
        
        setupAppIconView()
        setupAppNameCategoryView()
        setupActionButtonView()
        setupInAppPurchasesView()
        
    }
    
    private func setupAppIconView() {
        appIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        appIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        appIcon.widthAnchor.constraint(equalToConstant: 64).isActive = true
        appIcon.heightAnchor.constraint(equalToConstant: 64).isActive = true
        appIcon.layer.cornerRadius = 15
        appIcon.clipsToBounds = true
        appIcon.layer.borderWidth = 0.25
        appIcon.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupAppNameCategoryView() {
        appNameCategory.leftAnchor.constraint(equalTo: appIcon.rightAnchor, constant: 5).isActive = true
        appNameCategory.centerYAnchor.constraint(equalTo: appIcon.centerYAnchor, constant: 0).isActive = true
    }
    
    private func setupActionButtonView() {
        actionButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: appIcon.centerYAnchor, constant: 0).isActive = true
        
        let blueSystemDefault = UIColor(red: CGFloat(0.0), green: CGFloat(122.0/255), blue: CGFloat(1.0), alpha: 1)
        actionButton.setTitleColor(blueSystemDefault, for: .normal)
    }
    
    private func setupInAppPurchasesView() {
        purchasesTextFlag.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 5).isActive = true
        purchasesTextFlag.centerXAnchor.constraint(equalTo: actionButton.centerXAnchor, constant: 0).isActive = true
    }
    
    private func attributedAppNameAndCategory(name: String, category: String) -> NSAttributedString {
        let appName = "\(name)\n"
        let attributedText = NSMutableAttributedString(string: appName, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: category, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        let rangeAttributed = NSRange(location: 0, length: attributedText.string.count)
        attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: rangeAttributed)
        
        return attributedText
    }
    
}
