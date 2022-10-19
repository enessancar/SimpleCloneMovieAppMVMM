//
//  MovieCell.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 15.10.2022.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImageView : PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.downlaoadImage(movie: movie)
    }
    
    private func configureCell() {
        
        backgroundColor = .systemGray5
        layer.cornerRadius  = 16
        clipsToBounds = true
    }
    
    private func configurePosterImageView() {
        
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.pinToEdgesOf(view: self)
    }
}

