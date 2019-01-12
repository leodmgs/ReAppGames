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
            appTitle.text = appObject.name
        }
    }
    
    let appTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        
        addSubview(appTitle)
        
        backgroundColor = .green
        
        appTitle.backgroundColor = .yellow
        appTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        appTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        appTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
//        appTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
}
