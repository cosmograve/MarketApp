//
//  CartItem.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI
import Combine

struct CartItem: View {
    @EnvironmentObject var dataService: CartDataService
    var body: some View {        
        ForEach(dataService.cartItems) { item in
            HStack(alignment: .top, spacing: 8) {
                DishesImageView(dishesItem: item, showingText: false)
                    .frame(width: 62)
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(item.name)")
                        HStack(alignment: .top) {
                            Text("\(item.price) Р")
                            Text("\(item.weight)г")
                        }
                    }
                    Spacer()
                    CustomStepper(count: item.quanity, id: item.id)
                        .environmentObject(dataService)
                }
            }.padding(0)
        }
    }
    
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItem()
            .environmentObject(CartDataService())
    }
}
