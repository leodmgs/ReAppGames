//
//  PreviewCell.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class PreviewAppCollectionCell: DatasourceCell {
    
    override var dataItem: Any? {
        didSet {
            //@FIXME
            guard let app = dataItem as? String else { return }
            print("PreviewAppCollectionCell: \(app)")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
}
