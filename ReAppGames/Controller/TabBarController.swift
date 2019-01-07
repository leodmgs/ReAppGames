//
//  TabBarController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/5/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        let todayViewController = TodayViewController()
        todayViewController.title = "Today"
        todayViewController.tabBarItem.image = UIImage(named: "today")
        
        let gamesViewController = GamesViewController()
        let gamesViewNavigationController = UINavigationController(rootViewController: gamesViewController)
        gamesViewNavigationController.navigationItem.title = "Games"
        gamesViewNavigationController.title = "Games"
        gamesViewNavigationController.tabBarItem.image = UIImage(named: "games")
        
        let appFlowLayout = UICollectionViewFlowLayout()
        let appViewController = AppViewController(collectionViewLayout: appFlowLayout)
        appViewController.navigationItem.title = "Apps"
        let appViewNavigationController = UINavigationController(rootViewController: appViewController)
        appViewNavigationController.title = "Apps"
        appViewNavigationController.tabBarItem.image = UIImage(named: "apps")
        
        let updatesViewController = UpdatesViewController()
        let updatesViewNavigationController = UINavigationController(rootViewController: updatesViewController)
        updatesViewNavigationController.navigationItem.title = "Updates"
        updatesViewNavigationController.title = "Updates"
        updatesViewNavigationController.tabBarItem.image = UIImage(named: "updates")
        
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem.image = UIImage(named: "search")
        
        tabBar.isTranslucent = false
        
        viewControllers = [todayViewController, gamesViewNavigationController, appViewNavigationController, updatesViewNavigationController, searchViewController]
    }
    
}
