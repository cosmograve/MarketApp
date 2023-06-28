//
//  LocationManager.swift
//  MarketApp
//
//  Created by Алексей Авер on 28.06.2023.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    
    #warning("сделать переменную паблишд с названием города. получение города - в экстеншне, город передается во вьюмодел. во вью убрать отслеживание менеджера")
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.userLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined: print("notDetermined")
        case .authorizedWhenInUse: print("authorizedWhenInUse")
        case .authorizedAlways: print("authorizedAlways")
        case .restricted: print("restricted")
        case .denied: print("denied")
        @unknown default:
            break
        }
    }
}
