//
//  DetailsViewModel.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 27/01/23.
//

import Foundation

protocol DetailsViewModelProtocol {
    var movie: Movie { get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
}
