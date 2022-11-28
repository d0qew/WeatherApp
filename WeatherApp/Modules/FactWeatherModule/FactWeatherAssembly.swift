//  
//  FactWeatherBuilder.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import UIKit

final class FactWeatherAssembly{
   
    static func configure() -> UIViewController {
        let interactor = FactWeatherInteractor()
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
