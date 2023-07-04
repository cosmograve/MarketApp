//
//  DishesView.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import SwiftUI

struct DishesView: View {
    @EnvironmentObject var dataService: CartDataService
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    @StateObject private var viewModel = DishesViewViewModel()
    @State private var isSelected = false
    private var category: CategoryItem
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(category: CategoryItem) {
        self.category = category
    }
    var body: some View {
        VStack{
            DishesHeaderView(text: category.name)
                .padding(.top, 8)
                .padding(.horizontal, 16)
            
            TagsView(searchTag: $viewModel.searchTag)
                .padding(.leading, 16)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 30) {
                    let dishes = viewModel.dishes
                    ForEach(dishes) { dish in
                        DishesImageView(dishesItem: dish, showingText: true)
                        
                            .onTapGesture {
                                self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                    DetailsView(item: dish)
                                        .environmentObject(dataService)
                                    
                                }
                            }
                    }
                }
            }.padding(12)
            
            
        }.navigationBarHidden(true)
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView(category: CategoryItem(id: 1, name: "ymmy", imageURL: ""))
    }
}
