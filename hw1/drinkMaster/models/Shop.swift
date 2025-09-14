//
//  Shop.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import Foundation

struct Shop: Identifiable {
    let id = UUID()
    let name: String
    let logoURL: String?
    let location: String?
    
    // 預設值 = nil，呼叫時就可以不傳
        let drinks: [Drink]?
        let branches: [ShopBranch]?
        
        init(
            id: UUID = UUID(),
            name: String,
            logoURL: String? = nil,
            location: String? = nil,
            drinks: [Drink]? = nil,
            branches: [ShopBranch]? = nil
        ) {
            self.name = name
            self.logoURL = logoURL
            self.location = location
            self.drinks = drinks
            self.branches = branches
        }
}
