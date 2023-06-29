//
//  DishesViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import Foundation
import Combine

class DishesViewViewModel: ObservableObject {
    
    @Published var dishes: [DishesItem]?
    private let dataService = DishesDataService()
    private var cancellables = Set<AnyCancellable>()
    init() {
        addDishes()
    }
    
    func addDishes() {
        dataService.$dishes
            .sink(receiveValue: { [weak self] returned in
                if let returned = returned {
                    self?.dishes = returned.dishes
                }
                
            })
            .store(in: &cancellables)
    }
}
