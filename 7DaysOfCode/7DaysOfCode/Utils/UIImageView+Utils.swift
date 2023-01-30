//
//  UIView+Utils.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 30/01/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func configureImage(_ imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)")
        self.kf.setImage(with: url)
    }
}
