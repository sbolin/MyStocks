//
//  QuoteManagerProtocol.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] { get set }
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}
