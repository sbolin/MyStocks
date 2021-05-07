//
//  SearchTextView.swift
//  MyStocks
//
//  Created by Scott Bolin on 26-Apr-21.
//

import SwiftUI

struct SearchTextView: View {
    @Binding var searchTerm: String
    
    var body: some View {
        CustomTextField(placeholder: Text("Search").foregroundColor(Color.gray), text: $searchTerm)
            .foregroundColor(.white)
            .padding(.leading, 40)
            .frame(height: 32)
            .background(ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.4))
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.white)
                    .padding(.leading, 10)
            })
            .padding(.horizontal, 4)
    }
}

struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextView(searchTerm: .constant(""))
    }
}
