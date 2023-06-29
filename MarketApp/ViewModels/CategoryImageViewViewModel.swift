//
//  CategoryImageViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import SwiftUI
import Combine

class CategoryImageViewViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    @Published var text: String? = nil
    
    private let categoryItem: CategoryItem
    private var dataService: CategoryImageService
    private var cancellabes = Set<AnyCancellable>()
    
    init(categoryItem: CategoryItem) {
        self.categoryItem = categoryItem
        self.dataService = CategoryImageService(categoryItem: categoryItem)
        self.getImage()
        self.isLoading = true
        self.text = categoryItem.name
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
