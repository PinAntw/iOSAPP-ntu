//
//  ShopRepository.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import Foundation

protocol ShopRepository {
    func getShops() -> [Shop]
    func getBranches(for shopId: UUID) -> [ShopBranch]
}
