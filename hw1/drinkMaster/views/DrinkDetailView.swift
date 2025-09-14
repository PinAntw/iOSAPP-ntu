//
//  DrinkDetailView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import SwiftUI

struct DrinkDetailView: View {
    let drink: Drink
    let shop: Shop?
    
    var body: some View {
        VStack(spacing: 20) {
            // 飲料圖片
            if let urlString = drink.imageURL, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(height: 250)
                .cornerRadius(12)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 250)
                    .cornerRadius(12)
                    .overlay(Text(drink.name).font(.title))
            }
            
            // 飲料名稱
            Text(drink.name)
                .font(.title)
                .fontWeight(.bold)
            
            // 店家名稱
            if let shop = shop {
                Text("店家：\(shop.name)")
                    .font(.headline)
            }
            
            // 價格
            Text("$\(drink.price)")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("飲料資訊")
        .navigationBarTitleDisplayMode(.inline)
    }
}
