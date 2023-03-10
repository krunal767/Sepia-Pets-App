//
//  Date+Extension.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import Foundation

extension Date {

    func convertDateToStr(format: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let date = dateFormatter.string(from: self)
        return date
    }

}
