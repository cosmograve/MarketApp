//
//  MainView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewViewModel()
    
    var body: some View {
        VStack {
            MainHeaderView()
                .padding(.top, 8)
                .padding(.horizontal, 16)
            Spacer()
            
            
            if let categories = viewModel.categories {
                ForEach(categories) { category in
                    CategoryImageView(categoryItem: category)
                    
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
        
    }
}
