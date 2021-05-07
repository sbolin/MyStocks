//
//  ContentView.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stockQuoteManager = StockQuoteManager() //MockQuoteManager()
    
    @State private var stocks = UserDefaultsManager.shared.savedSymbols
    @State private var names = UserDefaultsManager.shared.savedNames
    @State private var searchTerm = ""
    @State private var oldStocks: [String] = []
    @State private var oldNames: [String] = []
        
    init() {
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color.black
            VStack(alignment: .leading) {
                HeaderView(stocks: $stocks, names: $names)
                    .padding(.top, 8)
                    .frame(height: 80)
                
//                MiniQuoteView(stockQuotes: stockQuoteManager)
//                    .foregroundColor(.white)
//                    .padding(.top, 50)
//                    .frame(height: 100)
                
                SearchTextView(searchTerm: $searchTerm)
                List {
                    Group {
                        ForEach(getQuotes()) { quote in
                            QuoteCell(quote: quote)
                        }
                        .onDelete(perform: { indexSet in
                            delete(at: indexSet)
                        })
                    }
                    .listRowBackground(Color.clear)
//                    .listRowInsets(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                }
                .onAppear {
                    fetchData(for: stocks)
                    oldStocks = stocks
                    oldNames = names
                }
                .onChange(of: stocks) { value in
                    fetchData(for: stocks.difference(from: oldStocks))
                    oldStocks = stocks
                    oldNames = names
                }
                .listStyle(PlainListStyle())
                .foregroundColor(.white)
            }
            .padding(.horizontal, 2)
 //           .padding(.bottom, UIScreen.main.bounds.height * 0.21)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func delete(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        print("index: \(index)")
        let symbol = stockQuoteManager.quotes[index].symbol
        let name = stockQuoteManager.quotes[index].name
        print("symbol: \(symbol) / \(name) ")
        UserDefaultsManager.shared.removeSymbol(symbol: symbol, name: name)
    }
    
    // return all quotes if no search term, otherwise filter on search term
    private func getQuotes() -> [Quote] {
        return searchTerm.isEmpty ? stockQuoteManager.quotes : stockQuoteManager.quotes.filter { $0.symbol.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    private func fetchData(for symbols: [String]) {
        stockQuoteManager.download(stocks: symbols) { _ in
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
