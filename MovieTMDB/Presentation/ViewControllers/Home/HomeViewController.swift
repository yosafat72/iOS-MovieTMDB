//
//  HomeViewController.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class HomeViewController: UIViewController {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    private let viewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
    private var popularMovieList: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
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
                self?.popularMovieList = data.results
                self?.popularCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.errorMessage
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] message in
                print(message)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupCollectionView(){
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        popularCollectionView.register(UINib(nibName: "PopularMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularMovieCollectionViewCell")
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCollectionViewCell", for: indexPath) as! PopularMovieCollectionViewCell
        
        let movie = popularMovieList[indexPath.row]
        
        if let imageURL = URL(string: APIConstants.SECURE_BASE_URL_IMAGE_PATH + movie.backdropPath) {
            cell.popularMovieIV.sd_setImage(with: imageURL)
            cell.popularMovieIV.contentMode = .scaleToFill
            cell.popularMovieIV.clipsToBounds = true
        }
        
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 234)
        }
    
}
