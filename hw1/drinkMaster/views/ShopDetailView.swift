//
//  ShopDetailView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//
import SwiftUI

struct ShopDetailView: View {
    @StateObject private var vm: ShopDetailViewModel
    @State private var selectedTab = 0
    
    init(shop: Shop) {
        _vm = StateObject(wrappedValue: ShopDetailViewModel(shop: shop))
    }
    
    var body: some View {
        VStack {
            // Segmented Control 切換
            Picker("選擇", selection: $selectedTab) {
                Text("飲品").tag(0)
                Text("分店").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            // Tab Content
            if selectedTab == 0 {
                // 飲品列表
                List(vm.drinks) { drink in
                    NavigationLink(
                        destination: DrinkDetailView(
                            drink: drink,
                            shop: vm.shop   // ✅ 傳入這家店
                        )
                    ) {
                        HStack {
                            Text(drink.name)
                            Spacer()
                            Text("$\(drink.price)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            } else {
                // 分店列表
                List(vm.branches) { branch in
                    VStack(alignment: .leading) {
                        Text(branch.name)
                            .font(.headline)
                        Text(branch.location)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle(vm.shop.name)  // ✅ 顯示商家名稱
    }
}
