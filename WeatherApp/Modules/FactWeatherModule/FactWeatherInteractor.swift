//  
//  FactWeatherInteractor.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation
import CoreLocation

protocol FactWeatherInteractorProtocol: AnyObject{
    func loadLocationInfo()
}

class FactWeatherInteractor {
    weak var presenter: FactWeatherPresenterProtocol?
    
    let locationService: LocationService?
    init(locationService: LocationService?) {
        self.locationService = locationService
    }
}

//  MARK: EXTENSION
extension FactWeatherInteractor: FactWeatherInteractorProtocol {
    
    func loadLocationInfo() {
        locationService?.requestPermission()
        DispatchQueue.global().async {
            self.locationService?.start(completion: { location in
                WeatherService.shared.getWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { weather in
                    
                    self.presenter?.didLoadWeather(weather: weather)
                }
            })
        }
    }
}




