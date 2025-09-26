//
//  ContentView.swift
//  hw3
//
//  Created by 李品安 on 2025/9/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showCompactSearch = false

    var body: some View {
        
        VStack(spacing: 0){
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 0) {
                        HeaderView()
                            .opacity(showCompactSearch ? 0 : 1)
                            .background(
                                    GeometryReader { proxy in
                                        let y = proxy.frame(in: .named("scroll")).minY
                                        Color.clear
                                            .preference(key: OffsetKey.self, value: y)
                                    }
                                )
                        
                        
                        CategoryBarView()
                        HStack(spacing: 25){
                            FoodIcon(foodicon: "breakfast", foodname: "早餐")
                            FoodIcon(foodicon: "fastfood", foodname: "速食")
                            FoodIcon(foodicon: "dish", foodname: "韓國美食")
                            FoodIcon(foodicon: "drink", foodname: "珍珠奶茶")
                            FoodIcon(foodicon: "discount", foodname: "優惠")
                        }
                        .padding(20)
                        TagBarView()
                        HStack {
                            Text("Uber Eats 精選推薦")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                            }){
                                Text("→")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 24, height: 24)
                                    .background(Circle().fill(Color.gray).opacity(0.2))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)

                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                FoodCard(imageName: "lemoncard",
                                         title: "樂檸漢堡",
                                         star: 4.9,
                                         deliverTime: 10)
                                FoodCard(imageName: "pigcard",
                                         title: "脆皮豬",
                                         star: 4.9,
                                         deliverTime: 10)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 8)
                        
                        HStack {
                            Text("您可能會喜歡的地點")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                            
                            Button(action: {
                            }){
                                Text("→")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 24, height: 24)
                                    .background(Circle().fill(Color.gray).opacity(0.2))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                RestaurantCard(imageName: "ramencard",
                                               title: "牛肉麵",
                                               deliverTime: 10)
                                RestaurantCard(imageName: "kfccard",
                                               title: "牛肉麵",
                                               deliverTime: 10)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 8)
                        HStack {
                            Text("您可能會喜歡的地點")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                            
                            Button(action: {
                            }){
                                Text("→")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 24, height: 24)
                                    .background(Circle().fill(Color.gray).opacity(0.2))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                RestaurantCard(imageName: "ramencard",
                                               title: "牛肉麵",
                                               deliverTime: 10)
                                RestaurantCard(imageName: "kfccard",
                                               title: "牛肉麵",
                                               deliverTime: 10)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 8)
                    }
                }
                .padding(.top, showCompactSearch ? 10 : 0)
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(OffsetKey.self) { value in
                    print("scroll offsets:", value)
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showCompactSearch = value < -50
                    }
                }
                
                if showCompactSearch {
                    SearchBarView()
                }
            }
            FooterView()
        }

    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
struct FoodIcon: View {
    let foodicon: String
    let foodname: String
    var body: some View {
        VStack(alignment: .center){
            Image(foodicon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipped()
                .padding(.bottom, 4)
            Text(foodname)
                .font(.caption)
                .foregroundColor(.black)
        }
        
    }
}
struct FoodCard: View {
    var imageName: String
    var title: String
    var star: Float
    var deliverTime: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 120)
                .clipped()
                .cornerRadius(12)

            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text("$0 外送費")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack(spacing: 4) {
                Text(String(format: "%.1f", star))
                    .foregroundColor(.black)

                Image(systemName: "star.fill")
                    .symbolEffect(.wiggle)
                    .foregroundColor(.gray)

                Text("(3,000+)")
                    .foregroundColor(.gray)

                Text("· \(deliverTime) 分鐘")
                    .foregroundColor(.gray)
            }
            .font(.subheadline)
        }
        .frame(width: 200)
        .padding(.trailing, 12)
    }
}
struct RestaurantCard: View {
    var imageName: String
    var title: String
    var deliverTime: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 120)
                .clipped()
                .cornerRadius(12)


            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text("$0 外送費")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack(spacing: 4) {
                Text("★整體最佳")
                    .foregroundColor(.black)

                Text("· \(deliverTime) 分鐘")
                    .foregroundColor(.gray)
            }
            .font(.subheadline)
        }
        .frame(width: 200)
        .padding(.trailing, 12)
    }
}





#Preview {
    HomeView()
}

