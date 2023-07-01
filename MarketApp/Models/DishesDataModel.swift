//
//  DishesDataModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import Foundation

struct Dishes: Codable {
    let dishes: [DishesItem]
    enum CodingKeys: String, CodingKey {
        case dishes
    }
}

struct DishesItem: Codable, Identifiable {
    let id: Int
    let name: String
    let price, weight: Int
    let description: String
    let imageURL: String
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description
        case imageURL = "image_url"
        case tags = "tegs"
    }
}

enum Tag: String, Codable, CaseIterable {
    case всеМеню = "Все меню"
    case сРисом = "С рисом"
    case сРыбой = "С рыбой"
    case салаты = "Салаты"
    
    init?(id: Int) {
        switch id {
        case 1: self = .всеМеню
        case 2: self = .сРисом
        case 3: self = .сРыбой
        case 4: self = .салаты
        default: return nil
        }
    }
}
#warning("codingKeys")
