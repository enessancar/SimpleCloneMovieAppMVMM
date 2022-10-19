//
//  DetailScreen.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 17.10.2022.

import UIKit

protocol DetailScreenInterface: AnyObject {
    
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
    func configureLanguageLabel()
}

final class DetailScreen: UIViewController {
    
    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    
    private let padding: CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    private var originalLanguageLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil  , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidload()
    }
}

extension DetailScreen: DetailScreenInterface {
 
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        
        let posterWidth = CGFloat.dWidth * 0.4
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.5)
        ])
        
        posterImageView.backgroundColor = .red
    }
    
    func downloadPosterImage() {
        
        posterImageView.downlaoadImage(movie: movie)
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints  = false
        
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .systemIndigo
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3 * padding),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.text = movie._overview
        overviewLabel.font = .systemFont(ofSize: 20)
        overviewLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor , constant: 2 * padding),
            overviewLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func configureLanguageLabel() {
        
        originalLanguageLabel = UILabel(frame: .zero)
        view.addSubview(originalLanguageLabel)
        
        originalLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        originalLanguageLabel.text = "Original Language : \(movie._originalLanguage)"
        originalLanguageLabel.font = .boldSystemFont(ofSize: 15.5)
        originalLanguageLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            originalLanguageLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor , constant: 2 * padding),
            originalLanguageLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            originalLanguageLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor)
        ])
    }
}
