//
//  String+Utiks.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 23/01/23.
//

import Foundation

extension String {
    func formatDate() -> Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"

        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "dd/MM/YYYY"

        if let date = dateFormatter.date(from: self) {
            return dateFormatted.string(from: date)
        } else {
           return "There was an error decoding the string"
        }
    }
}
