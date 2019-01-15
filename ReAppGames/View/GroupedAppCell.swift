//
//  GroupedAppCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/11/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class GroupedAppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            guard let appObject = app else { return }
            appTitle.attributedText = attributedAppNameAndCategory(name: appObject.name, category: appObject.category)
        }
    }
    
    let appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let appTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 3
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let purchasesTextFlag: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.gray
        label.text = "In-App Purchases"
        return label
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
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setupViews() {
        addSubview(appTitle)
        addSubview(separatorLine)
        addSubview(appIcon)
        addSubview(actionButton)
        addSubview(purchasesTextFlag)
        
        setupAppIconView()
        setupAppTitleView()
        setupSeparatorLineView()
        setupActionButtonView()
        setupInAppPurchasesView()
        
    }
    
    private func setupAppTitleView() {
        appTitle.leftAnchor.constraint(equalTo: appIcon.rightAnchor, constant: 10).isActive = true
        appTitle.centerYAnchor.constraint(equalTo: appIcon.centerYAnchor, constant: 0).isActive = true
        appTitle.rightAnchor.constraint(equalTo: actionButton.leftAnchor, constant: -10).isActive = true
    }
    
    private func setupSeparatorLineView() {
        separatorLine.leftAnchor.constraint(equalTo: appTitle.leftAnchor, constant: 0).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: CGFloat(0.3)).isActive = true
        separatorLine.backgroundColor = .lightGray
    }
    
    private func setupAppIconView() {
        appIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        appIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        appIcon.widthAnchor.constraint(equalToConstant: 68).isActive = true
        appIcon.heightAnchor.constraint(equalToConstant: 68).isActive = true
        appIcon.image = UIImage(named: "app-image-icon")
        appIcon.layer.cornerRadius = 15
        appIcon.clipsToBounds = true
        appIcon.layer.borderWidth = 0.5
        appIcon.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupActionButtonView() {
        let graySystem = UIColor(red: CGFloat(240.0/255), green: CGFloat(240.0/255), blue: CGFloat(240.0/255), alpha: 1)
        let blueSystemDefault = UIColor(red: CGFloat(0.0), green: CGFloat(122.0/255), blue: CGFloat(1.0), alpha: 1)
        
        actionButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: appIcon.centerYAnchor, constant: 0).isActive = true
        actionButton.backgroundColor = graySystem
        actionButton.setTitle("GET", for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        actionButton.titleLabel?.textAlignment = .center
        actionButton.layer.cornerRadius = 15
        actionButton.clipsToBounds = true
        actionButton.setTitleColor(blueSystemDefault, for: .normal)
    }
    
    private func setupInAppPurchasesView() {
        purchasesTextFlag.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 5).isActive = true
        purchasesTextFlag.centerXAnchor.constraint(equalTo: actionButton.centerXAnchor, constant: 0).isActive = true
    }
    
    private func attributedAppNameAndCategory(name: String, category: String) -> NSAttributedString {
        let appName = "\(name)\n"
        let attributedText = NSMutableAttributedString(string: appName, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: category, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        let rangeAttributed = NSRange(location: 0, length: attributedText.string.count)
        attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: rangeAttributed)
        
        return attributedText
    }
    
}
