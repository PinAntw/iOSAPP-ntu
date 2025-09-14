//
//  DrinkRowView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import SwiftUI

struct DrinkRowView: View {
    let drink: Drink
    
    var body: some View {
        VStack(spacing: 8) {
            if let imageURL = drink.imageURL, let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            }
            
            Text(drink.name)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 100)
    }
}
