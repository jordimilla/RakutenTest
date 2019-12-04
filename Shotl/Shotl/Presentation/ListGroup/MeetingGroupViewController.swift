//
//  ListGroupViewController.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MeetingGroupViewController: UIViewController {
    
    private let router: MeetingGroupRouter
    private let viewModel: MeetingGroupViewModel
    private let disposableBag = DisposeBag()
    
    
    public init(router: MeetingGroupRouter, viewModel: MeetingGroupViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
