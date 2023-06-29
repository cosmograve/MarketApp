//
//  DishesView.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import SwiftUI

struct DishesView: View {
    
    @StateObject private var viewModel = DishesViewViewModel()
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        List {
            ScrollView {
                LazyVGrid(columns: columns) {
                    if let dishes = viewModel.dishes {
                        ForEach(dishes) { dish in
                            DishesImageView(dishesItem: dish)
                        }
                    }
                }
            }
        }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}
