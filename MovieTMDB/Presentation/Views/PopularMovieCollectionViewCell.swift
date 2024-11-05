//
//  PopularMovieCollectionViewCell.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 05/11/24.
//

import UIKit

class PopularMovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var popularMovieIV: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainView.layer.shadowRadius = 4
    }

}
