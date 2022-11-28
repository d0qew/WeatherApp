//  
//  FactWeatherInteractor.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation

protocol FactWeatherInteractorProtocol: AnyObject {
    
}

final class FactWeatherInteractor: FactWeatherInteractorProtocol {
    weak var presenter: FactWeatherPresenterProtocol?
}
