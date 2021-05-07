//
//  Search.swift
//  MyStocks
//
//  Created by Scott Bolin on 27-Apr-21.
//

import Foundation

struct SearchResponse: Codable {
    let bestMatches: [Search]
}

struct Search: Codable, Identifiable {
    var id: UUID { return UUID() }
    let symbol: String
    let name: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
    }
}
