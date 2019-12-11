//
//  HeaderCollectionViewCell.swift
//  TestGeneric
//
//  Created by Jordi Milla on 11/12/2019.
//  Copyright © 2019 Rakuten TV Test. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
        
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
        self.backgroundColor = .red
      }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        addSubviewWithAutolayout(image)
        addSubviewWithAutolayout(lblName)
        image.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, topConstant: -40)
        image.anchor(heightConstant: 360)
        lblName.anchor(top: image.bottomAnchor, left: image.leftAnchor, bottom: bottomAnchor, right: image.rightAnchor, topConstant: -40, leftConstant: 5, rightConstant: 5)
        self.isUserInteractionEnabled = true
    }
    
    func configureCell(movie: ListMovie){
        image.downloaded(from: movie.artwork)
        lblName.text = movie.title
    }
}
