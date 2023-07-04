//
//  DishesImageView.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import SwiftUI

struct DishesImageView: View {
    @StateObject private var viewModel: DishesImageViewViewModel
    var showingText: Bool
    init(dishesItem: DishesItem, showingText: Bool) {
        _viewModel = StateObject(wrappedValue: DishesImageViewViewModel(dishesItem: dishesItem))
        self.showingText = showingText
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
                if showingText {
                    Text(text)
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .kerning(0.14)
                        .lineLimit(2)
                        .frame(height: 60, alignment: .leading)
                }
                
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
