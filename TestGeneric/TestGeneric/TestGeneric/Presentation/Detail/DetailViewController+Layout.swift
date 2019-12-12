//
//  DetailViewController+Layout.swift
//  TestGeneric
//
//  Created by Jordi Milla on 12/12/2019.
//  Copyright © 2019 Rakuten TV Test. All rights reserved.
//

import UIKit

extension DetailViewController {
    
    func setUpUI() {
        title = "RakutenTV"
        view.backgroundColor = .color(.black)
        navigationController?.navigationBar.backgroundColor = UIColor.black
        setUpSubviews()
        setupConstraints()
        setUpLabelsProperties()
    }
    
    func setUpSubviews () {
        view.addSubviewWithAutolayout(scrollView)
        scrollView.addSubviewWithAutolayout(containerView)
        containerView.addSubviewWithAutolayout(lblTitle)
        containerView.addSubviewWithAutolayout(imageView)
        containerView.addSubviewWithAutolayout(lblDescription)
    }
    
    func setupConstraints() {
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        containerView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor)
        imageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor)
        imageView.anchor(heightConstant: 600)
        lblTitle.anchor(top: imageView.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, topConstant: 20, leftConstant: 16, rightConstant: 16)
        lblDescription.anchor(top: lblTitle.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 10, leftConstant: 16, bottomConstant: 20, rightConstant: 16)
    }
    
    func setUpLabelsProperties() {
        lblTitle.textColor = .white
        lblTitle.font = UIFont.boldSystemFont(ofSize: 16)
        lblDescription.textColor = .white
        lblDescription.lineBreakMode = .byWordWrapping
        lblDescription.numberOfLines = 0
    }
    
}
