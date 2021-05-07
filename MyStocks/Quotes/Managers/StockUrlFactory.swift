//
//  StockUrlFactory.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

// called API.swift in video

import Foundation

struct StockUrlFactory {
 
    static var baseUrl: String {
        return BaseURLs.stock
    }
    
    static func symbolSearchUrl(for searchKey: String) -> String {
        return urlBy(symbol: .search, searchKey: searchKey)
    }
    
    static func quoteUrl(for searchKey: String) -> String {
        return urlBy(symbol: .quote, searchKey: searchKey)
    }
    
    private static func urlBy(symbol: SymbolFunction, searchKey: String) -> String {
        switch symbol {
            case .search:
                return "\(baseUrl)function=\(symbol.rawValue)&keywords=\(searchKey)&apikey=\(Secrets.stock)"
            case .quote:
                return "\(baseUrl)function=\(symbol.rawValue)&symbol=\(searchKey)&apikey=\(Secrets.stock)"
        }
    }
    
    enum SymbolFunction: String {
        case search = "SYMBOL_SEARCH"
        case quote = "GLOBAL_QUOTE"
    }
}


// stock, symbol search: https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=SAIC&apikey=???

// stock, quotes: https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=???

