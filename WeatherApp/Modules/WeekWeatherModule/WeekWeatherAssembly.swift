//
//  WeekWeatherAssembly.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import UIKit

class WeekWeatherAssembly {
    
    static func configure() -> UIViewController {
        let locationService = LocationService()
        let interactor = WeekWeatherInteractor(locationService: locationService)
        let router = WeekWeatherRouter()
        let presenter = WeekWeatherPresenter(router: router, interactor: interactor)
        let view = WeekWeatherViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
