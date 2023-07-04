//
//  MainTabView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var cartDataService = CartDataService()

    var body: some View {
        TabView() {
            NavigationView {
                MainView()
            }.tabItem {
                Image("main")
                Text("Главная")
            }
            Text("пусто")
                .tabItem {
                    Image("search")
                    Text("Поиск")
                }
            CartView()
                .tabItem {
                    Image("Cart")
                    Text("Корзина")
                }
            Text("пусто")
                .tabItem {
                    Image("account")
                    Text("Аккаунт")
                }
            
        }
        .accentColor(Color("blueButton"))
        .environmentObject(cartDataService)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            
    }
}
