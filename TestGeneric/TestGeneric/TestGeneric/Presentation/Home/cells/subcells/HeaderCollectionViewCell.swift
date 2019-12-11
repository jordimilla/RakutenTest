//
//  HeaderCollectionViewCell.swift
//  TestGeneric
//
//  Created by Jordi Milla on 11/12/2019.
//  Copyright © 2019 Rakuten TV Test. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.text = "Martes · 3"
        return label
    }()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        cardView.addSubviewWithAutolayout(image)
        cardView.addSubviewWithAutolayout(lblName)
        addSubviewWithAutolayout(cardView)
        
        cardView.anchor(top: topAnchor,left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        image.anchor(top: topAnchor,left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

      }

      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    func setUpCellHeader(movie: ListMovie){
        image.downloaded(from: movie.snapshot)
    }
    func setUpCell(movie: ListMovie){
        image.downloaded(from: movie.artwork)
    }
}
