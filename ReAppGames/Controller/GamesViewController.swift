//
//  GameViewController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 1/5/19.
//  Copyright © 2019 Leonardo Domingues. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
        navigationItem.title = "Games"
    }
    
}
