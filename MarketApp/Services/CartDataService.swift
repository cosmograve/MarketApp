//
//  CartDataService.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import Foundation
import SwiftUI
import Combine

@MainActor class CartDataService: ObservableObject {
    
    @Published var cartItems: [DishesItem] = []
    @Published var price: Int = 0
    
    func addToCart(cartItem: DishesItem) {
        if let _ = cartItems.firstIndex(where: { currentItem in
            return cartItem.id == currentItem.id
        }){
            cartItem.quanity += 1
        } else {
            cartItem.quanity = 1
            cartItems.append(cartItem)
        }
    }
    
    func getTotalPrice() -> Int {
        var total = 0
        cartItems.forEach { item in
            total += item.price * item.quanity
        }
//        self.price = total
        return total
    }
    
    func deleteItem(item: DishesItem) {
        if let index = cartItems.firstIndex(where: { currentItem in
            return item.id == currentItem.id
        }){
            cartItems.remove(at: index)
        }
    }
    
    func increase(item: DishesItem) {
        cartItems.filter({$0.id == item.id}).first?.quanity += 1
        self.price = getTotalPrice()
    }
    
    func decrease(item: DishesItem) {
        cartItems.filter({$0.id == item.id}).first?.quanity -= 1
        self.price = getTotalPrice()
    }
}
