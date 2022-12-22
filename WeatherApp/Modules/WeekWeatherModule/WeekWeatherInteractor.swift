//
//  WeekWeatherInteractor.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import Foundation

protocol WeekWeatherInteractorProtocol: AnyObject {
    
}

class WeekWeatherInteractor: WeekWeatherInteractorProtocol {
    weak var presenter: WeekWeatherPresenterProtocol?
}
