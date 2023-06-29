//
//  MainViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import Foundation
import Combine

class MainViewViewModel: ObservableObject {
    
    @Published var categories: [CategoryItem]?
    private let dataService = CategoryDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addCategories()
    }
    
    func addCategories() {
        dataService.$categories
            .sink(receiveValue: { [weak self] returned in
                if let returned = returned {
                    self?.categories = returned.сategories
                }
                
            })        
            .store(in: &cancellables)
    }
}
