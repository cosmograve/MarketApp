//
//  CategoriesDataModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import Foundation

struct Categories: Codable {
    let сategories: [CategoryItem]
    enum CodingKeys: String, CodingKey {
        case сategories
        
    }
}

struct CategoryItem: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
