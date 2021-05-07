//
//  QuoteCell.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import SwiftUI

struct QuoteCell: View {
    var quote: Quote
    var smallNumberDecimalFormatter = Formatter.smallNumberDecimalFormatter
    var largeNumberSeparatorFormatter = Formatter.largeNumberSeparatorFormatter
    
    var body: some View {
        
        // note this should all go into a view model
        
        let price = Double(quote.price)!
//        let open = Double(quote.open)!
        let low = Double(quote.low)!
        let high = Double(quote.high)!
        let vol = Double(quote.volume)!
        let change = Double(quote.change)!
        let changePercent = Double(quote.changePercentDouble)
        let lowCurrent: Bool = price / low > 1 ? true : false
        let highCurrent: Bool =  price / high > 1 ? true : false
        let width: CGFloat = 90
        
        let formattedPrice = smallNumberDecimalFormatter.string(from: NSNumber(value: price))!
//        let formattedOpen = smallNumberDecimalFormatter.string(from: NSNumber(value: open))!
        let formattedVol = largeNumberSeparatorFormatter.string(from: NSNumber(value: vol))!
        let formattedLow = smallNumberDecimalFormatter.string(from: NSNumber(value: low))!
        let formattedHigh = smallNumberDecimalFormatter.string(from: NSNumber(value: high))!
        let formattedChange = smallNumberDecimalFormatter.string(from: NSNumber(value: change))!
        let formattedChangePercent = smallNumberDecimalFormatter.string(from: NSNumber(value: changePercent))!
        let greenHighlight = Color.green.opacity(0.4)
        let redHighlight = Color.red.opacity(0.4)
        
        
        VStack {
            HStack(spacing: 3) {
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(quote.symbol)
                        .font(.system(size: 26, weight: .regular, design: .monospaced))
                        .frame(width: 65)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(formattedPrice)")
                        .font(.system(size: 24, weight: .light, design: .monospaced))
                        .frame(width: 138)
                    Text("V: \(formattedVol)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(maxWidth: 138)
                }
                
                VStack(alignment:. leading, spacing: 12) {
                    Text("L \(formattedLow)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(lowCurrent ? greenHighlight : redHighlight))
                    Text("H \(formattedHigh)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(highCurrent ? greenHighlight : redHighlight))
                }
                VStack(alignment:. leading, spacing: 12) {
                    Text("Δ  \(formattedChange)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: 0.8 * width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Double(quote.change)! > 0.0 ? greenHighlight : redHighlight))
                    Text("Δ% \(formattedChangePercent)")
                        .font(.system(size: 12, weight: .light, design: .monospaced))
                        .frame(width: 0.8 * width)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Double(quote.change)! > 0.0 ? greenHighlight : redHighlight), alignment: .trailing)
                    
                }
            } // HStack
            .frame(height: 62)
//            Rectangle()
//                .fill(Color.gray)
//                .frame(height: 1)
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
