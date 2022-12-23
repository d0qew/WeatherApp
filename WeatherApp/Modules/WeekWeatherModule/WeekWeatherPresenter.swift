//
//  WeekWeatherPresenter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import Foundation

protocol WeekWeatherPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadWeather(weather: Weather)
}

class WeekWeatherPresenter {
    weak var view: WeekWeatherViewControllerProtocol?
    var router: WeekWeatherRouterProtocol
    var interactor: WeekWeatherInteractorProtocol
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter
    }
    
    init(router: WeekWeatherRouterProtocol, interactor: WeekWeatherInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

//  MARK: EXTENSION

extension WeekWeatherPresenter: WeekWeatherPresenterProtocol {
    func viewDidLoaded() {
        interactor.loadLocationInfo()
    }
    
    func didLoadWeather(weather: Weather) {
        let weekArray = WeatherDaysStorage()
        for i in 0...(weather.forecasts.count) - 1 {
            weekArray.addNewElement(WeatherDayClass(date: formatter.string(from: weather.forecasts[i].date_ts),
                                                    sunrise: weather.forecasts[i].sunrise,
                                                    sunset: weather.forecasts[i].sunset,
                                                    wind: weather.forecasts[i].parts.day.wind_speed,
                                                    temp: weather.forecasts[i].parts.day.temp_avg,
                                                    condition: weather.forecasts[i].parts.day.condition))
        }
        view?.showWeather(weather: weather, WeekForCell: weekArray)
    }
}
