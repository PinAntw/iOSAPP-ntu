//
//  ShopCardView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import SwiftUI

struct ShopCardView: View {
    let shop: Shop
    
    var body: some View {
        HStack(spacing: 12) {
            if let logo = shop.logoURL, let url = URL(string: logo) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(shop.name)
                    .font(.body)
                    .fontWeight(.medium)
                if let location = shop.location {
                    Text(location)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}
//#Preview {
//    ShopCardView(
//        shop: Shop(
//            name: "50嵐",
//            logoURL: nil,
//            location: "台北市"
//        )
//    )
//    .previewLayout(.sizeThatFits) // 讓它自動收窄
//    .padding()
//}
//
