//
//  LocationService.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 29.11.2022.
//

import UIKit
import CoreLocation

final class LocationService: NSObject {
    private let locationManager = CLLocationManager()
    var completion: ((CLLocation) -> Void)?
    override init() {
        super.init()
        configurate()
    }
    
    private func configurate() {
        locationManager.delegate = self
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }
    
    func requestPerrmission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func start(completion: @escaping (CLLocation) -> Void) {
        self.completion = completion
        locationManager.startUpdatingLocation()
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {return}
        print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        completion?(lastLocation)
        manager.stopUpdatingLocation()
    }
}
