//
//  MovieModel.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import Foundation
import UIKit

struct Movie: Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String?
    let overview: String
//    let poster_path: String
    let voteAverage: Double
}
