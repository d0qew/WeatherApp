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

extension FactWeatherPresenter: FactWeatherPresenterProtocol {
    func didLoadWeather(weather: Weather) {
        view?.showWeather(weather: weather)
    }
    
    func viewDidLoaded() {
        interactor.loadLocationInfo()
    }
}
