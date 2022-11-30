//  
//  FactWeatherRouter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import UIKit

protocol FactWeatherRouterProtocol: AnyObject {
    
}

class FactWeatherRouter: FactWeatherRouterProtocol{
    
    weak var presenter: FactWeatherPresenterProtocol?
}

