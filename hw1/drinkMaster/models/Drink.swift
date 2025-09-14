//
//  Drink.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/10.
//

import Foundation

struct Drink: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let imageURL: String?
    let shopId: UUID
}
