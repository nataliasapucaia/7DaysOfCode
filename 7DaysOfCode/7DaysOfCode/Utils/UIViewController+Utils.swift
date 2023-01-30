//
//  UIViewController+Utils.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 27/01/23.
//

import UIKit

extension UIView {

    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.topColor.cgColor, UIColor.bottomColor.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
