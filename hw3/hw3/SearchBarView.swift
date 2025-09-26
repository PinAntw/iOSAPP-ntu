//
//  SearchBarView.swift
//  hw3
//
//  Created by 李品安 on 2025/9/25.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack(spacing: 20){
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.leading)
                Text("搜尋 Uber Eats")
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(width: 320, height: 50)
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .padding(.leading, 0)
            
            Button(action: {
            }) {
                Image(systemName: "cart")
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .background(Color.white)
        }
    
    }

#Preview {
    SearchBarView()
}
