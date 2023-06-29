//
//  MainTabView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image("main")
                    Text("Главная")
                }
            
            Text("пусто")
                .tabItem {
                    Image("search")
                    Text("Главная")
                }
            
            BucketView()
                .tabItem {
                    Image("bucket")
                    Text("Главная")
                }
            
            Text("пусто")
                .tabItem {
                    Image("account")
                    Text("Главная")
                }
        }
        .accentColor(Color("blueButton"))
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
