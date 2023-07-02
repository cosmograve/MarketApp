//
//  MainTabView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct MainTabView: View {
    
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
                }.tag(1)
            
            BucketView(value: 0)
                .tabItem {
                    Image("bucket")
                    Text("Корзина")
                }.tag(2)
            
            Text("пусто")
                .tabItem {
                    Image("account")
                    Text("Аккаунт")
                }.tag(3)
            
        }
        .accentColor(Color("blueButton"))
        
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
