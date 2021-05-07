//
//  SearchManager.swift
//  MyStocks
//
//  Created by Scott Bolin on 27-Apr-21.
//

import Foundation

final class SearchManager: ObservableObject {
    @Published var searches = [Search]()
    
    func searchStocks(keyword: String) {
        let urlString = StockUrlFactory.symbolSearchUrl(for: keyword)
        guard let url = URL(string: urlString) else { return }
        NetworkManager<SearchResponse>().fetch(from: url) { result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.searches = response.bestMatches
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
