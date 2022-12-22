//
//  WeekWeatherRouter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import UIKit

protocol WeekWeatherRouterProtocol: AnyObject {
    
}

class WeekWeatherRouter: WeekWeatherRouterProtocol {
    weak var view: WeekWeatherViewControllerProtocol?
    
}
