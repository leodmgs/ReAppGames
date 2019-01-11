//
//  Datasource.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/10/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import Foundation

class Datasource: NSObject {
    
    var data: [Any]?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(_ section: Int) -> Int {
        return 0
    }
    
    func cellClasses() -> [DatasourceCell.Type] {
        return []
    }
    
    func item(_ indexPath: IndexPath) -> Any? {
        if let dataObject = data {
            return dataObject[indexPath.item]
        }
        return nil
    }
    
}
