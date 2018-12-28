//
//  HomeGamesViewController.swift
//  ReAppGames
//
//  Created by Leonardo Domingues on 12/28/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

class HomeGamesViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(FeaturedGameCell.self, forCellWithReuseIdentifier: FeaturedGameCell.cellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let featuredGameCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedGameCell.cellIdentifier, for: indexPath)
        return featuredGameCell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}
