//
//  CartView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI
import Combine

class CartViewViewModel: ObservableObject {
    
}
struct CartView: View {
    @EnvironmentObject private var dataService: CartDataService
    var body: some View {
        VStack{
            MainHeaderView()
                .padding(.top, 8)
                .padding(.horizontal, 16)
            if dataService.cartItems.isEmpty {
                Spacer()
                Text("корзина пуста")
                Spacer()
            } else {
                ScrollView{
                    CartItem()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                
                BlueButton(title: "Оплатить \(dataService.getTotalPrice())") {
                    
                }
                .frame(height: 78)
            }
            
            
        }
        
       
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartDataService())
    }
}
