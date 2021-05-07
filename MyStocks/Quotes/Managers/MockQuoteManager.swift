//
//  MockQuoteManager.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import Foundation

final class MockQuoteManager: QuoteManagerProtocol, ObservableObject {
    
    @Published var quotes: [Quote] = []

    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl = Quote(
            symbol: "AAPL",
            open: "135.90",
            high: "136.39",
            low: "133.77",
            price: "135.13",
            volume: "4556700",
            date: "2021-04-23",
            previous: "135.39",
            change: "-0.26",
            changePercent: "-0.1900%")
        
        let goog = Quote(
            symbol: "GOOG",
            open: "2099.51",
            high: "2102.03",
            low: "2077.32",
            price: "2095.89",
            volume: "4556700",
            date: "2021-04-23",
            previous: "2095.38",
            change: "0.51",
            changePercent: "0.0240%")
        
        for _ in 0..<8 {
            quotes.append(contentsOf: [aapl, goog])
        }
    }
    
}
