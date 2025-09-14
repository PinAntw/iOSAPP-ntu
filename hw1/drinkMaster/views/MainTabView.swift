//
//  MainTabView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // 首頁
            HomeView()
                .tabItem {
                    Label("首頁", systemImage: "house.fill")
                }
            
            DrinkSwipeView()
                .tabItem {
                    Label("發現", systemImage: "flame.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
