//
//  WeekWeatherViewController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import UIKit

protocol WeekWeatherViewControllerProtocol: AnyObject {
   
}

class WeekWeatherViewController: UIViewController {
    var presenter: WeekWeatherPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1)
    }
}

//  MARK: EXTENSION

extension WeekWeatherViewController: WeekWeatherViewControllerProtocol {
    
}
