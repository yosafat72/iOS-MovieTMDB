//
//  HomeViewController.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModel
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindViewModel()
        
        viewModel.getPopularMovie(for: "en-US", page: 1)
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindViewModel(){
        viewModel.movieData
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] data in
                print(data)
            })
            .disposed(by: disposeBag)
        
        viewModel.errorMessage
                    .observe(on: MainScheduler.instance)
                    .subscribe(onNext: { [weak self] message in
                        // Handle error, e.g., show an alert
                        print(message) // You can show this in an alert or label
                    })
                    .disposed(by: disposeBag)
    }

}
