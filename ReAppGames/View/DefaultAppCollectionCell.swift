//
//  DefaultAppCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/11/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class DefaultAppCollectionCell: DatasourceCell {
    
    let defaultTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
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
        appCollectionView.isHidden = true
        backgroundColor = .lightGray
        addSubview(defaultTextLabel)
        defaultTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        defaultTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        defaultTextLabel.widthAnchor.constraint(equalToConstant: self.layer.bounds.width)
        defaultTextLabel.heightAnchor.constraint(equalToConstant: self.layer.bounds.height)
    }
    
}
