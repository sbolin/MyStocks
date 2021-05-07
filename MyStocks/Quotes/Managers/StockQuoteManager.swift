//
//  StockQuoteManager.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
    @Published var quotes: [Quote] = []
        
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var internalQuotes = [Quote]()
        let downloadQueue = DispatchQueue(label: "stockQueue")
        let downloadGroup = DispatchGroup()
        
        stocks.forEach { stock in
            downloadGroup.enter()
            let urlString = StockUrlFactory.quoteUrl(for: stock)
            guard let url = URL(string: urlString) else { return }
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) { result in
                switch result {
                    case .success(let response):
                        downloadQueue.async {
                            internalQuotes.append(response.quote)
                            downloadGroup.leave()
                        }
                    case .failure(let error):
                        print(error)
                        downloadQueue.async {
                            downloadGroup.leave()
                        }
                }
            }
        }
        downloadGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(internalQuotes))
            DispatchQueue.main.async {
                self.quotes.append(contentsOf: internalQuotes)
            }
        }
    }
}
