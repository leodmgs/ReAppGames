//
//  FeaturedCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/9/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class FeaturedAppCollectionCell: DatasourceCell {
    
    override var dataItem: Any? {
        didSet {
            //@FIXME
            guard let apps = dataItem as? [String] else { return }
            print("FeaturedCell received \(apps.count) App data: ")
            for app in apps {
                print("\(app)")
            }
        }
    }
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .orange
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(appNameLabel)
        
        appNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appNameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        appNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        appNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
    }
    
}
