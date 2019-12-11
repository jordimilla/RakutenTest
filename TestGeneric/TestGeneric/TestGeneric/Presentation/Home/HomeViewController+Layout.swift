//
//  HomeViewController+Layout.swift
//  TestGeneric
//
//  Created by Jordi Milla on 11/12/2019.
//  Copyright © 2019 Rakuten TV Test. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setUpUI() {
        setUpSubviews()
        setupConstraints()
        setUpCollectionViewProperties()
    }
    
    private func setUpSubviews () {
        self.title = "Cinema"
        self.view.backgroundColor = .color(.black)
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
        view.addSubviewWithAutolayout(collectionView)
    }
    
    func setupConstraints() {
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
        
    func setUpCollectionViewProperties() {
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(MovieCollectionViewCell.self))
        collectionView.isPagingEnabled = true
        collectionView.reloadData()
    }
}
