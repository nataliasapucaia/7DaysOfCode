//
//  ViewCode.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import Foundation

protocol CodeView {
    func buildVierHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildVierHierarchy()
        setUpConstraints()
        setUpAdditionalConfiguration()
    }
}
