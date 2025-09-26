//
//  CategoryBarView.swift
//  hw3
//
//  Created by 李品安 on 2025/9/25.
//

import SwiftUI

struct CategoryBarView: View {
    let categories = ["全部", "生鮮雜貨", "便利商店", "家庭和自己動手做", "Uber Health"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 40)
        .background(Color.white)
    }
}
#Preview {
    CategoryBarView()
}
