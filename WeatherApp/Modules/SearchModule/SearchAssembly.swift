//  
//  SearchBuilder.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 20.12.2022.
//

import UIKit

class SearchAssembly {
    
    static func configure() -> UIViewController {
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(router: router, interactor: interactor)
        let view = SearchViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
