//
//  GenericAppHeaderCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "steve-jobs")
        imageView.layer.cornerRadius = 21
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(userImageView)
        
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 9).isActive = true
        
        userImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
