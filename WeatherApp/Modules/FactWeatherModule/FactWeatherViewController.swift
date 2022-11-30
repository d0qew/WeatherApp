//  
//  FactWeatherViewController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import UIKit
import CoreLocation



protocol FactWeatherViewControllerProtocol: AnyObject {
    func showWeather(weather: Weather)
    func viewDidLoad()
}

class FactWeatherViewController: UIViewController {
    var presenter: FactWeatherPresenter?
    
    var cityLabel = UILabel()
    var dateLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        setup()
    }
}

extension FactWeatherViewController: FactWeatherViewControllerProtocol {
    
    func showWeather(weather: Weather) {
        print(weather)
    }

    func setup() {
        view.backgroundColor = .blue
        
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.right.left.equalToSuperview().inset(10)
            
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel).inset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    func updateDate() {
        cityLabel.text = ""
        cityLabel.font = UIFont(name: "Menlo-Bold", size: 20)
        cityLabel.textAlignment = .center
        cityLabel.textColor = .white
        
        dateLabel.text = "Ноябрь 25, 2022"
        dateLabel.font = UIFont(name: "Menlo", size: 20)
        cityLabel.textAlignment = .center
        dateLabel.textColor = .white
    }
}
