//
//  Formatters.swift
//  MyStocks
//
//  Created by Scott Bolin on 6-May-21.
//

import Foundation

struct Formatter {
    
    static var smallNumberDecimalFormatter: NumberFormatter {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
//        numberFormat.minimumFractionDigits = 2
        numberFormat.maximumFractionDigits = 2
        return numberFormat
    }
    
    static var largeNumberSeparatorFormatter: NumberFormatter {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat
    }
    
    static var percentFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter
    }
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }
    
    static var dailyDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM"
        return dateFormatter
    }
}
