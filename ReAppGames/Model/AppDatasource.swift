//
//  GamesDatasource.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import Foundation

class AppDatasource: Datasource {
    
    var featuredApps: [String] = ["Twitter", "Whatsapp", "Instagram", "Youtube", "Uber"]
    var groupedApps: [String] = ["Runastic", "Lifesum", "Pocket", "Facetune", "TouchRetouch", "Afterlight", "Full Fitness"]
    var previewApps: [String] = ["Duolingo", "Udemy", "Udacity", "Coursera", "English", "LinkedIn", "Nike", "IFood"]
    
    var dataApp: [[String]] = [
        ["Twitter", "Whatsapp", "Instagram", "Youtube", "Uber"],
        ["Runastic", "Lifesum", "Pocket", "Facetune", "TouchRetouch", "Afterlight", "Full Fitness"],
        ["Duolingo", "Udemy", "Udacity", "Coursera", "English", "LinkedIn", "Nike", "IFood"]
    ]
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [FeaturedAppCollectionCell.self, GroupedAppCollectionCell.self, PreviewAppCollectionCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 3
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        switch section {
        case 0:
            return featuredApps.count
        case 1:
            return groupedApps.count
        case 2:
            return previewApps.count
        default:
            print("[Warning] numberOfItems(_ section: ) section index not found")
            return 0
        }
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return dataApp[indexPath.item]
//        switch indexPath.section {
//        case 0:
//            return dataApp[indexPath.item]
//        case 1:
//            return groupedApps[indexPath.item]
//        case 2:
//            return previewApps[indexPath.item]
//        default:
//            print("[Warning] item(_ indexPath: ) section index not found")
//            return 0
//        }
    }
    
}
