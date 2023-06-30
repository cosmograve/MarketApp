//
//  DishesView.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import SwiftUI

struct DishesView: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    @StateObject private var viewModel = DishesViewViewModel()
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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(1..<50, id:\.self) { n in
                        BlueButton(title: "nnnnnnnnnnnn") {
                            
                        }
                    }
                }
                .padding(.horizontal, 10)
                .frame(height: 75)
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    if let dishes = viewModel.dishes {
                        ForEach(dishes) { dish in
                            DishesImageView(dishesItem: dish)
                                .onTapGesture {
                                    self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                        DetailsView()
                                    }
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
