//
//  HomeViewModel.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var shops: [Shop] = []
    @Published var popularDrinks: [Drink] = []
    
    private let shopRepo: ShopRepository
    private let drinkRepo: DrinkRepository
    
    init(
        shopRepo: ShopRepository = MockShopRepository(),
        drinkRepo: DrinkRepository = MockDrinkRepository()
    ) {
        self.shopRepo = shopRepo
        self.drinkRepo = drinkRepo
        loadData()
    }
    
    func loadData() {
        shops = shopRepo.getShops()
        if let firstShop = shops.first {
            popularDrinks = drinkRepo.getDrinks(for: firstShop.id)
        }
    }
}
