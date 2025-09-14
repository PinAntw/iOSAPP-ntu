//
//  MockShopRepository.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import Foundation

class MockShopRepository: ShopRepository {
    func getShops() -> [Shop] {
        [
            Shop(name: "50嵐",
                 logoURL: "https://static.iyp.tw/5910/products/photooriginal-480051-VxXeN.png",
                 location: "台北市"),
            Shop(name: "清心福全",
                 logoURL: "https://www.chingshin.tw/upload/image/%E6%A9%AB%E5%BC%8F-%E6%B8%85%E5%BF%83%E6%A8%99%E6%BA%96logo.png",
                 location: "台中市")
        ]
    }
    
    func getBranches(for shopId: UUID) -> [ShopBranch] {
        [
            ShopBranch(name: "50嵐 台北站前店", location: "台北市中正區"),
            ShopBranch(name: "50嵐 板橋店", location: "新北市板橋區")
        ]
    }
}
