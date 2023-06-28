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
        locationManager.$userLocation
            .sink { [weak self] (returnedlocation) in
                self?.cityName = "\(returnedlocation?.coordinate.longitude)"
            }
            .store(in: &cancellables)
    }
    
    func avatarTapped() {
        print("avatar tapped")
    }
}
