//
//  SearchView.swift
//  MyStocks
//
//  Created by Scott Bolin on 8-May-21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    
    @ObservedObject var searchManager = SearchManager()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack {
                HStack {
                    SearchTextView(searchTerm: $searchTerm)
                    Button(action: {
                        searchManager.searchStocks(keyword: searchTerm)
                    }) {
                        Image(systemName: "arrowtriangle.right.circle.fill")
                            .font(.title)
                            .foregroundColor(.green.opacity(0.6))
                    }
                    .disabled(searchTerm == "")
                }
                Spacer()
                
                ScrollView {
                    ForEach(searchManager.searches) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.symbol)
                                    .font(.title3)
                                Text(item.type)
                                    .font(.body)
                            }
                            Spacer()
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                UserDefaultsManager.shared.set(symbol: item.symbol, name: item.name)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            }
                            .foregroundColor(Color.white.opacity(0.7)) // for the plus image
                        } // HStack
                        .foregroundColor(.white)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .frame(height: 3)
                    } // ForEach
                }
            }
            .padding(.top, 50)
            .padding(.horizontal, 8)
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
