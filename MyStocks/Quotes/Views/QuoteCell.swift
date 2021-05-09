//
//  QuoteCell.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import SwiftUI

struct QuoteCell: View {
    
    var quote: Quote
    
    var greenHighlight = Color.green.opacity(0.4)
    var redHighlight = Color.red.opacity(0.4)
    var width: CGFloat = 90

    var body: some View {
        VStack {
            HStack(spacing: 3) {
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(quote.symbol)
                        .font(.system(size: 26, weight: .regular, design: .monospaced))
                        .frame(width: 65)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(quote.formattedPrice)")
                        .font(.system(size: 24, weight: .light, design: .monospaced))
                        .frame(width: 138)
                    Text("V: \(quote.formattedVol)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(maxWidth: 138)
                }
                
                VStack(alignment:. leading, spacing: 12) {
                    Text("L \(quote.formattedLow)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(quote.lowCurrent ? greenHighlight : redHighlight))
                    Text("H \(quote.formattedHigh)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(quote.highCurrent ? greenHighlight : redHighlight))
                }
                VStack(alignment:. leading, spacing: 12) {
                    Text("Δ  \(quote.formattedChange)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: 0.8 * width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(quote.changeD > 0.0 ? greenHighlight : redHighlight))

                    Text("Δ% \(quote.formattedChangePercent)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: 0.8 * width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(quote.changeD > 0.0 ? greenHighlight : redHighlight), alignment: .trailing)
                }
            } // HStack
            .frame(height: 62)
        } // VStack
        .frame(maxWidth: .infinity)
    } // View
}

struct QuoteCell_Previews: PreviewProvider {
    
    static var previews: some View {
        QuoteCell(quote: Quote(
                    symbol: "AAPL",
                    open: "13500.90",
                    high: "13600.39",
                    low: "13300.77",
                    price: "13500.13",
                    volume: "4556700",
                    date: "2021-04-23",
                    previous: "1350.39",
                    change: "-0.26",
                    changePercent: "-0.1900%"))
        //            .preferredColorScheme(.dark)
    }
}
