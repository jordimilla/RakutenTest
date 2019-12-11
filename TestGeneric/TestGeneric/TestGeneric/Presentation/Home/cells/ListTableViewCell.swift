//
//  ListTableViewCell.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 13/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit

protocol ListTableViewCellCellProtocol {
    func goDetailMovie()
}

class ListTableViewCell: UITableViewCell {
    
    var delegate: HomeViewController?
    var movies:[ListMovie] = []
    
    lazy var titleCollection: UILabel = {
        let label = UILabel()
        label.textColor = .color(.white)
        return label
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 140, height: 210)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HeaderCollectionViewCell.self))
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.clear
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addViews() {
        addSubviewWithAutolayout(titleCollection)
        addSubviewWithAutolayout(collectionView)
        titleCollection.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, topConstant: 10, leftConstant: 20)
        collectionView.anchor(top: titleCollection.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, topConstant: 10)
        collectionView.anchor(heightConstant: 210)
    }
    
    func configureCell(delegate: HomeViewController){
        self.delegate = delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        titleCollection.text = "Estrenos"
    }
    
}

extension ListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: NSStringFromClass(HeaderCollectionViewCell.self), for: indexPath) as! HeaderCollectionViewCell
        cell.setUpCell(movie: movies[indexPath.row])
        return cell
    }
    

}

extension ListTableViewCell: UICollectionViewDelegate {
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //        goDetailMovie()
        print("Click")
    }
}

extension ListTableViewCell: ListTableViewCellCellProtocol{
    func goDetailMovie() {
        delegate?.router.goDetail()
    }
}
