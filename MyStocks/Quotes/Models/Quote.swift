//
//  Quote.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    let quote: Quote
    
    enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}

struct Quote: Codable {
    let symbol: String
    let open: String
    let high: String
    let low: String
    let price: String
    let volume: String
    let date: String
    let previous: String
    let change: String
    let changePercent: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case volume = "06. volume"
        case date = "07. latest trading day"
        case previous = "08. previous close"
        case change = "09. change"
        case changePercent = "10. change percent"
    }
    
    var changePercentDouble: Double {
        let percent = changePercent
        let characterSet = CharacterSet(charactersIn: "%")
        
        let trimmedPercent = percent.trimmingCharacters(in: characterSet)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.number(from: trimmedPercent) as! Double
    }
    
    var name: String {
        return "Company"
    }
}

extension Quote: Identifiable {
    var id: UUID {
        return UUID()
    }
}

/*
 symbol: "AAPL",//
 open: "135.90",
 high: "136.39",//
 low: "133.77",//
 price: "135.13",//
 volume: "4556700",
 date: "2021-04-23",
 previous: "135.39",
 change: "-0.26",
 changePercent: "-0.1900%"))
 */
