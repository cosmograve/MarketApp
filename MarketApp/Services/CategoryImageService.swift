//
//  CategoryImageService.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import Foundation
import SwiftUI
import Combine

class CategoryImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let categoryItem: CategoryItem
    
    init(categoryItem: CategoryItem) {
        self.categoryItem = categoryItem
        getImage()
    }
    
    private func getImage() {
        guard let url = URL(string: categoryItem.imageURL) else {return}
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (data) in
                self?.image = data
                self?.imageSubscription?.cancel()
            })
        
    }
}
