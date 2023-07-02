//
//  DishesViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import Foundation
import Combine

class DishesViewViewModel: ObservableObject {
    
    @Published var dishes: [DishesItem] = []
    @Published var searchTag: Tag = .всеМеню
    private let dataService = DishesDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addDishes()
    }
    
    func addDishes() {
        $searchTag
            .combineLatest(dataService.$dishes)
            .map { (tags, startDishes) -> [DishesItem] in
                return startDishes?.dishes.filter { (dish) -> Bool in
                    return dish.tags.contains(tags)
                } ?? self.dishes
                
            }
            .sink { [weak self] returned in
                self?.dishes = returned
            }
            .store(in: &cancellables)
    }
    
}
