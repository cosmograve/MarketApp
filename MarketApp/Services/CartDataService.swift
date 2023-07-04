//
//  CartDataService.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import Foundation
import SwiftUI


@MainActor final class CartDataService: ObservableObject {
    
    @Published var cartItems: [DishesItem] = []
//    @Published var cartItems: [DishesItem] = [DishesItem(id: 1, name: "12", price: 66, weight: 66, description: "234", imageURL: "", tags: [.всеМеню]),
//                                              DishesItem(id: 2, name: "12", price: 36, weight: 66, description: "232434", imageURL: "", tags: [.всеМеню])
//    ]

    
    func addToCart(cartItem: DishesItem) {
        
        cartItems.append(cartItem)
        
    }
    
    func getTotalPrice() -> Int {
        var total = 0
        cartItems.forEach { item in
            total += item.price * item.quanity
        }
        return total
    }
    
    func increase() {
        
//        cartItems.filter { $0.id == id }.first?.quanity += 1
    }
    
    func decrease() {
//        if cartItems.filter({ $0.id == id }).first?.count == 1 {
//            deleteFromCart(cartItem: cartItem)
//        } else {
//            cartItems.filter { $0.id == id }.first?.count -= 1
//        }
        
    }
    
    func deleteFromCart() {
        
//        if let index = cartItems.firstIndex(where: { currentItem in
//            return cartItem.id == currentItem.id
//        }){
//            cartItems.remove(at: index)
//        }
            
    }
}
