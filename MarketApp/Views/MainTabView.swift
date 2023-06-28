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
            
            SearchView()
                .tabItem {
                    Image("search")
                    Text("Главная")
                }
            
            BucketView()
                .tabItem {
                    Image("bucket")
                    Text("Главная")
                }
            
            AccountView()
                .tabItem {
                    Image("account")
                    Text("Главная")
                }
        }
        .accentColor(Color("blue"))
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
