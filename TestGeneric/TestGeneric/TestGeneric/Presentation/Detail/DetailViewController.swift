//
//  HomeViewController.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {

    private var router: DetailRouter
    private var viewModel: DetailViewModel
    private var disposableBag = DisposeBag()
    var id: String = ""
    let scrollView = UIScrollView()
    let containerView = UIView()
    let imageView = UIImageView()
    let lblTitle = UILabel()
    let lblDescription = UILabel()
    let btnClose = UIButton()
    
    init(router: DetailRouter,
         viewModel: DetailViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViewModel()
        viewModel.getDetailMovie(id: self.id)
    }
    
    func configureData(movie: Movie) {
        lblTitle.text = movie.title
        imageView.downloaded(from: movie.image)
        lblDescription.text = movie.description
    }
    
    @objc func goBack() {
        router.goHome()
    }
}

extension DetailViewController {
    
    private func setUpViewModel(){
        viewModel.movie.asObservable()
            .bind(onNext: { [weak self] (status) in
                guard let safeStatus = status else{
                    return
                }
                switch safeStatus {
                case .loading:
                    break
                    
                case .success(let movie):
                    guard let movie:Movie = movie else { return }
                    self?.configureData(movie: movie)
                    break
                case .fail:
                    // TODO error handle
                    break
                }
                
            })
            .disposed(by: disposableBag)
    }
}
