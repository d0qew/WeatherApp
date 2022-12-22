//
//  WeekWeatherPresenter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import Foundation

protocol WeekWeatherPresenterProtocol: AnyObject {

}

class WeekWeatherPresenter: WeekWeatherPresenterProtocol {
    weak var view: WeekWeatherViewControllerProtocol?
    var router: WeekWeatherRouterProtocol
    var interactor: WeekWeatherInteractorProtocol
    
    
    init(router: WeekWeatherRouterProtocol, interactor: WeekWeatherInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}
