//
//  DishesImageViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import SwiftUI
import Combine

class DishesImageViewViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    @Published var text: String? = nil
    
    private let dishesItem: DishesItem
    private var dataService: DishesImageService
    private var cancellabes = Set<AnyCancellable>()
    
    init(dishesItem: DishesItem) {
        self.dishesItem = dishesItem
        self.dataService = DishesImageService(dishesItem: dishesItem)
        self.getImage()
        self.isLoading = true
        self.text = dishesItem.name
    }
    
    private func getImage() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellabes)
    }
}
