//
//  SearchBar.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import SwiftUI

struct SearchBar: View {
    @State private var text = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("搜尋飲料或店家", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
