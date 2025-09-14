//
//  DrinkRepository.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import Foundation

protocol DrinkRepository {
    func getDrinks(for shopId: UUID) -> [Drink]
}
