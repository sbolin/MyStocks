//
//  MiniQuoteView.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import SwiftUI

struct MiniQuoteView: View {
    @ObservedObject var stockQuotes: StockQuoteManager //StockQuoteManager
    var smallNumberDecimalFormatter = Formatter.smallNumberDecimalFormatter
    
    var largeNumberSeparatorFormatter = Formatter.largeNumberSeparatorFormatter
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(stockQuotes.quotes) { quote in
                    VStack {
                        
                        let price = Double(quote.price)!
                        let formattedPrice = smallNumberDecimalFormatter.string(from: NSNumber(value: price))!

                        Text(quote.symbol)
                            .font(.subheadline)
                            .bold()
                        Text(formattedPrice)
                            .font(.subheadline)
                        Text(quote.change)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .frame(width: 90)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .center)
                    }.background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.2)))
                    .foregroundColor(.white)
                }
            }//.background(Color.gray)
        }
        .onAppear {
            stockQuotes.download(stocks: []) { _ in }
        }
    }
}

struct MiniQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        MiniQuoteView(stockQuotes: StockQuoteManager())  // StockQuoteManager
            .preferredColorScheme(.dark)
    }
}
