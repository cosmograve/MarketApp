//
//  DishesImageService.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import Foundation
import SwiftUI
import Combine

class DishesImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let dishesItem: DishesItem
    
    init(dishesItem: DishesItem) {
        self.dishesItem = dishesItem
        getImage()
    }
    
    private func getImage() {
        guard let url = URL(string: dishesItem.imageURL) else {return}
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (data) in
                self?.image = data
                self?.imageSubscription?.cancel()
                print("dish image got")
            })
        
    }
}
