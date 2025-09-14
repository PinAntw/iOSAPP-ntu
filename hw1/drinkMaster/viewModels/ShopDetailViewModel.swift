//
//  ShopDetailViewModel.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import Foundation
import Combine


class ShopDetailViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    @Published var branches: [ShopBranch] = []
    
    let shop: Shop
    
    private let drinkRepo: DrinkRepository
    private let shopRepo: ShopRepository
    
    init(
        shop: Shop,
        drinkRepo: DrinkRepository = MockDrinkRepository(),
        shopRepo: ShopRepository = MockShopRepository()
    ) {
        self.shop = shop
        self.drinkRepo = drinkRepo
        self.shopRepo = shopRepo
        loadData()
    }
    
    private func loadData() {
        drinks = drinkRepo.getDrinks(for: shop.id)
        branches = shopRepo.getBranches(for: shop.id)
    }
}

