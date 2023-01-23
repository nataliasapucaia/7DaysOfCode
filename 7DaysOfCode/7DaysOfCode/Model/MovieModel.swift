//
//  MovieModel.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import Foundation
import UIKit

struct MovieResults: Decodable {
    let results: [Movie]
}
struct Movie: Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String?
    let overview: String
    let posterPath: String
    let voteAverage: Double

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case image
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
