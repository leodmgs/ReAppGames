//
//  GamesDatasource.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import Foundation

class AppDatasource: Datasource {
    
    // Attributes
    
    var dataApp: [[String]] = [
        ["Twitter", "Whatsapp", "Instagram", "Youtube", "Uber"],
        ["Runastic", "Lifesum", "Pocket", "Facetune", "TouchRetouch", "Afterlight", "Full Fitness", "Coursera", "English", "LinkedIn", "Nike", "IFood"],
        ["Duolingo", "Udemy", "Udacity"]
    ]
    
    let availableCellClasses: [DatasourceCell.Type] = [
        FeaturedAppCollectionCell.self, GroupedAppCollectionCell.self, PreviewAppCollectionCell.self, DefaultAppCollectionCell.self
    ]
    
    
    // Functions
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return availableCellClasses
    }
    
    override func numberOfSections() -> Int {
        // The data will be represented by category, according to the classes available
        return dataApp.count
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return dataApp[section].count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return dataApp[indexPath.section]
    }
    
}
