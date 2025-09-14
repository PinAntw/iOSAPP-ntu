//
//  DrinkSwipeViewModel.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import Foundation
import Combine

class DrinkSwipeViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    
    private let drinkRepo: DrinkRepository
    
    init(drinkRepo: DrinkRepository = MockDrinkRepository()) {
        self.drinkRepo = drinkRepo
        loadData()
    }
    
    func loadData() {
        // 這裡先假設用第一間店的 id 來抓飲料
        let dummyShopId = UUID()
        drinks = drinkRepo.getDrinks(for: dummyShopId)
    }
    
    func removeDrink(_ drink: Drink) {
        if let index = drinks.firstIndex(where: { $0.id == drink.id }) {
            drinks.remove(at: index)
        }
    }
}
