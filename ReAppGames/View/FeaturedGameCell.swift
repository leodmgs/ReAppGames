//
//  FeaturedGameCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class FeaturedGameCell: UICollectionViewCell {
    
    static let cellIdentifier = "featured-game-id"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
