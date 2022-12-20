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

class FactWeatherInteractor: FactWeatherInteractorProtocol {
    weak var presenter: FactWeatherPresenterProtocol?
    
    let locationService: LocationService?
    init(locationService: LocationService?) {
        self.locationService = locationService
    }
}

extension FactWeatherInteractor {
    
    func loadLocationInfo() {
        locationService?.requestPerrmission()
        DispatchQueue.global().async {
            self.locationService?.start(completion: { location in
                WeatherService.shared.getWeather(latitude: location.coordinate.latitude, longtitude: location.coordinate.longitude) { weather in
                    
                    self.presenter?.didLoadWeather(weather: weather)
                }
            })
        }
    }
}




