//
//  HomeViewModel.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 14.10.2022.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeScreenInterface? { get set }
    
    func viewDidload()
    func getMovies()
}

final class HomeViewModel {
    
    weak var view: HomeScreenInterface?
    private let service = MovieService()
    var movies : [MovieResult] = []
    private var page: Int = 1
}

extension HomeViewModel: HomeViewModelInterface {
    
    func viewDidload() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.downloadMovies(page: 1) { [weak self] returnedMovies in
            
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedDetail in
            
            guard let self = self else {return}
            guard let returnedDetail = returnedDetail else {return}
            
            self.view?.navigateToDetailScreen(movie: returnedDetail)
        }
    }
}

