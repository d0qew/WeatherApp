//  
//  SearchInteractor.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 20.12.2022.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
}

class SearchInteractor: SearchInteractorProtocol {
    weak var presenter: SearchPresenter?
}
