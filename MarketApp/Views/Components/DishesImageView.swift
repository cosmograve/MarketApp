//
//  DishesImageView.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import SwiftUI

struct DishesImageView: View {
    @StateObject private var viewModel: DishesImageViewViewModel
    
    init(dishesItem: DishesItem) {
        _viewModel = StateObject(wrappedValue: DishesImageViewViewModel(dishesItem: dishesItem))
    }
    var body: some View {
        if let image = viewModel.image,
            let text = viewModel.text {
            VStack {
                ZStack() {
                    Rectangle()
                        .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.96))
                        .cornerRadius(10)
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                Text(text)
                    .multilineTextAlignment(.center)
                    .frame(height: 30)
                #warning("стиль текста + ячейки фиксированного размера")
            }
            
            
            
        } else if viewModel.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark")
        }
    }
}

struct DishesImageView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView(category: CategoryItem(id: 1, name: "ymmy", imageURL: ""))
    }
}
