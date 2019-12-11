//
//  PremieresCollectionViewCell.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 13/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class PremieresTableViewCell: UITableViewCell {
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 260)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HeaderCollectionViewCell.self))
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    var movies:[ListMovie] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.clear
        addViews()
        configureCell()
        collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addViews() {
        addSubviewWithAutolayout(collectionView)
        collectionView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor)
        collectionView.anchor(heightConstant: 260)
    }
    
    func configureCell(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension PremieresTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: NSStringFromClass(HeaderCollectionViewCell.self), for: indexPath) as! HeaderCollectionViewCell
        cell.setUpCellHeader(movie: movies[indexPath.row])
        return cell
    }
    
    
}

extension PremieresTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
