//
//  DrinkCardView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//
import SwiftUI

struct DrinkCardView: View {
    let drink: Drink
    
    var body: some View {
        VStack {
            if let urlString = drink.imageURL, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(height: 200)
                .clipped()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
                    .overlay(Text(drink.name).font(.largeTitle))
            }
            
            Text(drink.name)
                .font(.title2)
                .padding(.top, 8)
            
            Text("店家 ID: \(drink.shopId.uuidString.prefix(6))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("$\(drink.price)")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: 350)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding(.horizontal, 20)
    }
}
