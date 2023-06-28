//
//  MainHeaderViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import Foundation
import CoreLocation

class MainHeaderViewViewModel: ObservableObject {
    @Published var cityName = "Омск"
    @Published var date = ""
    
    init() {
        getStringDate()
    }
    
    private func getStringDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.date = dateFormatter.string(from: Date())
    }
    
    func avatarTapped() {
        print("avatar tapped")
    }
}
