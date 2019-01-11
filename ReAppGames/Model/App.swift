//
//  App.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import Foundation

struct App {
    let name: String
    let shortDescription: String
    let category: String
    let price: Float
    let inAppPurchases: Bool
    
    init(appName: String, category: String, price: Float, shortDescription: String = "") {
        self.name = appName
        self.category = category
        self.price = price
        self.shortDescription = shortDescription
        self.inAppPurchases = false
    }
}
