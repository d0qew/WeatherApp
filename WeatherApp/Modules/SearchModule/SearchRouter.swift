//  
//  SearchRouter.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 20.12.2022.
//

import UIKit

protocol SearchRouterProtocol: AnyObject {
}

class SearchRouter: SearchRouterProtocol {
    weak var view: SearchViewControllerProtocol?
}

