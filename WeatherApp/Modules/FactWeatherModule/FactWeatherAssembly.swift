//  
//  FactWeatherBuilder.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import UIKit

class FactWeatherAssembly{
   
    static func configure() -> UIViewController {
        let locationService = LocationService()
        let interactor = FactWeatherInteractor(locationService: locationService)
        let router = FactWeatherRouter()
        let presenter = FactWeatherPresenter(router: router, interactor: interactor)
        let view = FactWeatherViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        
        return view
    }
}
