//
//  CartView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI
import Combine

struct CartView: View {
    @EnvironmentObject var dataService: CartDataService
    @State var buttonTitle: Int?
    
    var body: some View {
        VStack{
            MainHeaderView()
                .padding(.top, 8)
                .padding(.horizontal, 16)
            if $dataService.cartItems.isEmpty {
                Spacer()
                Text("корзина пуста")
                Spacer()
            } else {
                ScrollView(showsIndicators: false) {
                    ForEach($dataService.cartItems) { $item in
                        HStack(alignment: .center, spacing: 8) {
                            Cart(item: $item)
                                .environmentObject(dataService)
                            
                        }.padding(16)
                    }
                }
                
                BlueButton(title: "Оплатить \(dataService.getTotalPrice()) ₽") {
                    
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

class CartViewModel: ObservableObject {
    
}
struct Cart: View {
    @StateObject var viewModel = CartViewModel()
    @EnvironmentObject var dataService: CartDataService
    @Binding var item: DishesItem
    @State var count: Int?
    
    
    var body: some View {
        DishesImageView(dishesItem: item, showingText: false)
            .frame(width: 62)
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black)
                HStack(alignment: .top) {
                    Text("\(item.price) ₽")
                        .font(Font.system(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black)
                    
                    Text("· \(item.weight)г")
                        .font(Font.system(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.65))
                }
            }
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Button {
                    if item.quanity > 0 {
                        dataService.decrease(item: item)
                        
                        self.count = item.quanity
                        if item.quanity == 0 {
                            dataService.deleteItem(item: item)
                        }
                        
                    }
                    
                } label: {
                    Image("minus")
                }
                
                Text("\(item.quanity)")
                
                Button {
                    dataService.increase(item: item)
                    self.count = item.quanity
                    
                    
                } label: {
                    Image("plus")
                }
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(Color(red: 0.94, green: 0.93, blue: 0.93))
            .cornerRadius(10)
            
        }
        
    }
}

