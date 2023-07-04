//
//  MainHeaderViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import Foundation
import CoreLocation
import Combine

class MainHeaderViewViewModel: ObservableObject {
    @Published var cityName = "Омск"
    @Published var date = ""
    var cancellables = Set<AnyCancellable>()
    
    private var locationManager = LocationManager()
    init() {
        getStringDate()
        getLocation()
    }
    
    private func getStringDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.date = dateFormatter.string(from: Date())
    }
    
    private func getLocation() {
        locationManager.$nameLocation
            .sink { [weak self] (returnedlocation) in
                guard let name = returnedlocation else {
                    self?.cityName = ""
                    return
                }
                self?.cityName = name
            }
            .store(in: &cancellables)
    }
    
    func avatarTapped() {
        print("avatar tapped")
    }
}
