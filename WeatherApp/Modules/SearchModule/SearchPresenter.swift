//  
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 20.12.2022.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {

}

class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewControllerProtocol?
    var router: SearchRouterProtocol
    var interactor: SearchInteractorProtocol
    
    
    init(router: SearchRouterProtocol, interactor: SearchInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

//  MARK: EXTENSION
