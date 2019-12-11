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
        return label
    }()
        
    override init(frame: CGRect) {
          super.init(frame: frame)
        addSubviewWithAutolayout(image)
        addSubviewWithAutolayout(lblName)

        image.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, topConstant: 50)
        image.anchor(heightConstant: 600)
        lblName.anchor(top: image.bottomAnchor, left: image.leftAnchor, right: image.rightAnchor, topConstant: 10, leftConstant: 16)
      }

      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    func configureCell(movie: ListMovie){
        image.downloaded(from: movie.artwork)
        lblName.text = movie.title
    }
}
