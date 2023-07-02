//
//  BasketItemDataModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import Foundation

struct BasketData: Codable {
    let items: [BasketItemData]
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct BasketItemData: Codable, Identifiable {
    let id: UUID
    let item: DishesItem
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case item, count, id
    }
}


