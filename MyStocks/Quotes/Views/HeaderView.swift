//
//  HeaderView.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import SwiftUI

struct HeaderView: View {
    
    private let dateFormatter = Formatter.dailyDateFormatter
    
    @Binding var stocks: [String]
    @Binding var names: [String]
    
    @State private var showSearch = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Stocks")
                    .foregroundColor(.white)
                
                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
            }.font(.title)
            
            Spacer()
            
            Button {
                showSearch.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }.sheet(isPresented: $showSearch, onDismiss: {
                self.stocks = UserDefaultsManager.shared.savedSymbols
                self.names = UserDefaultsManager.shared.savedNames
            }, content: {
                SearchView()
            })
        }
        .padding(.horizontal, 4)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(stocks: .constant(["AAPL", "GOOG"]), names: .constant(["Apple", "Google"]))
            .preferredColorScheme(.dark)
    }
}
