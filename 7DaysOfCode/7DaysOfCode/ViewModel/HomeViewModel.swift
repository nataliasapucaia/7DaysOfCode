//
//  HomeViewModel.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 23/01/23.
//

import Foundation

enum FetchMovieState {
    case initial
    case data
}

protocol HomeViewModelProtocol {
    var movies: [Movie] { get set }
    var state: Bindable<FetchMovieState> { get }

    func fetchMovies()
}

class HomeViewModel: HomeViewModelProtocol {
    var state: Bindable<FetchMovieState> = Bindable(.initial)
    var movies: [Movie] = []
    let network = Network()

    func fetchMovies() {
        network.fetchPopularMovies { movies in
            self.movies = movies
            self.state.value = .data
        }
    }
}
