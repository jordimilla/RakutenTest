//
//  HomeViewController.swift
//  TestGenericTest
//
//  Created by Jordi Milla on 12/07/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {

    enum sections: Int {
        case premier = 0
        case list = 1
    }
    
    var router: HomeRouter
    private var viewModel: HomeViewModel
    private var disposableBag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(PremieresTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PremieresTableViewCell.self))
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ListTableViewCell.self))
        return tableView
    }()
    
    var items: [ListMovie] = []
    
    init(router: HomeRouter,
         viewModel: HomeViewModel) {
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
        setUpLayout()
        setDelegates()
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .color(.black)
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
        self.title = "Portada"
        view.addSubviewWithAutolayout(tableView)
    }
    
    private func setUpLayout() {
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    private func setDelegates() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getListMovies()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case sections.premier.rawValue:
            let cell = tableView.dequeueReusableCell( withIdentifier: NSStringFromClass(PremieresTableViewCell.self), for: indexPath) as! PremieresTableViewCell
            return cell
        case sections.list.rawValue:
            let cell = tableView.dequeueReusableCell( withIdentifier: NSStringFromClass(ListTableViewCell.self), for: indexPath) as! ListTableViewCell
            cell.configureCell(delegate: self)
            return cell
        default:
            return UITableViewCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case sections.premier.rawValue:
            return 1
        case sections.list.rawValue:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case sections.premier.rawValue:
            return 260
        case sections.list.rawValue:
            return 250
        default:
            return 0
        }
      
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController {
    
    private func setUpViewModel(){
        viewModel.movies.asObservable()
            .bind(onNext: { [weak self] (status) in
                guard let safeStatus = status else{
                    return
                }
                switch safeStatus {
                case .loading:
                    break
                    
                case .success(let array):
                    self?.items = array ?? []
                    self?.tableView.reloadData()
                    break
                case .fail:
                    // TODO error handle
                    break
                }
                
            })
            .disposed(by: disposableBag)
        
    }
    
}
