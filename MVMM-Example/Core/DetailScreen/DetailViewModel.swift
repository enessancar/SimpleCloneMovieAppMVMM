//
//  DetailViewModel.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 17.10.2022.

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? { get set }
    
    func viewDidload()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface?
}

extension DetailViewModel: DetailViewModelInterface {
    
    func viewDidload() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
        view?.configureLanguageLabel()
    }
}
// filmin değerlendirme yada farklı bi özellik ekle urlden bakıp neleri taşıyosa eklemeye çalış
