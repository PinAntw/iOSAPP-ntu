//
//  TagBarView.swift
//  hw3
//
//  Created by 李品安 on 2025/9/25.
//
import SwiftUI

struct TagBarView: View {
    let tags = ["Uber One", "自取", "優惠方案", "不到 30 分鐘"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 50)
        .background(Color.white)
    }
}

#Preview {
    TagBarView()
}
