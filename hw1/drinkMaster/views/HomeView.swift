//
//  HomeView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // 搜尋列
                SearchBar()
                
                // ScrollView 包含熱門店家 & 熱門飲料
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // 熱門飲料
                        Text("熱門飲料")
                            .font(.headline)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(vm.popularDrinks) { drink in
                                    // 找到這杯飲料對應的店家
                                    let shop = vm.shops.first { $0.id == drink.shopId }
                                    
                                    NavigationLink(destination: DrinkDetailView(drink: drink, shop: shop)) {
                                        DrinkRowView(drink: drink)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal)
                        }

                        // 熱門店家
                        Text("熱門店家")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(vm.shops) { shop in
                            NavigationLink(destination: ShopDetailView(shop: shop)) {
                                ShopCardView(shop: shop)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle()) // 避免 NavigationLink 的藍色高亮
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("DrinkPassport")
        }
    }
}

//#Preview {
//    HomeView()
//}
