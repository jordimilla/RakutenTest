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
        setUpFlowLayoutProperties()
        setUpCollectionViewProperties()
        setUpSubviews()
        setupConstraints()
    }
    
    private func setUpSubviews () {
        title = "Cinema"
        view.backgroundColor = .color(.black)
        navigationController?.navigationBar.backgroundColor = UIColor.black
        view.addSubviewWithAutolayout(collectionView)
    }
    
    func setupConstraints() {
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setUpFlowLayoutProperties() {
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 200, height: 320)
        layout.scrollDirection = .vertical
    }
        
    func setUpCollectionViewProperties() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(MovieCollectionViewCell.self))
        collectionView.isPagingEnabled = true
        collectionView.allowsMultipleSelection = false
    }
}
