//
//  MockDrinkRepository.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//

import Foundation

class MockDrinkRepository: DrinkRepository {
    func getDrinks(for shopId: UUID) -> [Drink] {
        [
            Drink(name: "珍珠奶茶",
                  price: 50,
                  imageURL: "https://img.shoplineapp.com/media/image_clips/66f7d7d52d4266c0fcb52af9/original.jpg?1727518677",
                  shopId: shopId),
            Drink(name: "珍珠香緹紅茶拿鐵",
                  price: 45,
                  imageURL: "https://dwfavn5d0m4r1.cloudfront.net/App_Images/750/ChannelProduct/2024/1210/48deb3cb-f12d-497d-8823-635eb768d62c.jpg.webp",
                  shopId: shopId)
        ]
    }
}
