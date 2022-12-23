//
//  WeekWeatherInteractor.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import Foundation

protocol WeekWeatherInteractorProtocol: AnyObject {
    func loadLocationInfo()
}

class WeekWeatherInteractor {
    weak var presenter: WeekWeatherPresenterProtocol?
    let locationService: LocationService?
    
    init(locationService: LocationService?) {
        self.locationService = locationService
    }
}

extension WeekWeatherInteractor: WeekWeatherInteractorProtocol {
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
