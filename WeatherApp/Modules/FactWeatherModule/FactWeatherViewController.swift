//  
//  FactWeatherViewController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation
import UIKit



protocol FactWeatherViewControllerProtocol: AnyObject {
    
}

final class FactWeatherViewController: UIViewController {
    var presenter: FactWeatherPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FactWeatherViewController: FactWeatherViewControllerProtocol {
    
    
}
