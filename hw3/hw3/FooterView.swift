//
//  FooterView.swift
//  hw3
//
//  Created by 李品安 on 2025/9/25.
//
import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "house.fill")
                Text("首頁")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)

            VStack {
                Image(systemName: "cart.fill")
                Text("生鮮雜貨")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)

            VStack {
                Image(systemName: "magnifyingglass")
                Text("瀏覽")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)

            VStack {
                Image(systemName: "list.bullet.rectangle")
                Text("訂單")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)

            VStack {
                Image(systemName: "person.crop.circle")
                Text("帳戶")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.top, 8)
        .padding(.bottom, 20)
        .background(Color.white)
        .shadow(radius: 2)
    }
}



#Preview {
    FooterView()
}
