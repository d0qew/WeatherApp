//  
//  FactWeatherPresenter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation

protocol FactWeatherPresenterProtocol: AnyObject {
    func didLoadWeather(weather: Weather)
    func viewDidLoaded()
}

class FactWeatherPresenter {
    weak var view: FactWeatherViewControllerProtocol?
    var router: FactWeatherRouterProtocol
    var interactor: FactWeatherInteractor
    
    
    init(router: FactWeatherRouterProtocol, interactor: FactWeatherInteractor) {
        self.router = router
        self.interactor = interactor
        
    }
}

//  MARK: EXTENSION
extension FactWeatherPresenter: FactWeatherPresenterProtocol {
    func viewDidLoaded() {
        interactor.loadLocationInfo()
    }
    
    func didLoadWeather(weather: Weather) {
        let hoursArray = WeatherHoursStorage()
        for i in 0...(weather.forecasts.first?.hours.count)! - 1 {
            hoursArray.addNewElement(WeatherHour(hour: (weather.forecasts.first?.hours[i].hour)!,
                                                   temp: (weather.forecasts.first?.hours[i].temp)!,
                                                   condition: (weather.forecasts.first?.hours[i].condition)!))
        }
        view?.showWeather(weather: weather, hoursForCell: hoursArray)
    }
}
