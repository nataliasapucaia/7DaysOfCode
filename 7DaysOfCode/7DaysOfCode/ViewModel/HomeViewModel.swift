//
//  HomeViewModel.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 23/01/23.
//

import Foundation

class HomeViewModel {
    var movies: [Movie] = []
    let network = Network()

    func fetchMovies() {
        network.fetchPopularMovies { movies in
            self.movies = movies
        }
    }
}
