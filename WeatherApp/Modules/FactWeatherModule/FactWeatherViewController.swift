//  
//  FactWeatherViewController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import UIKit
import CoreLocation


protocol FactWeatherViewControllerProtocol: AnyObject {
    func showWeather(weather: Weather, hoursForCell: WeatherHoursStorage)
    func viewDidLoad()
}

class FactWeatherViewController: UIViewController {
    var presenter: FactWeatherPresenterProtocol?
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter
    }
    
//    var colorBackground = UIColor()
    var cityLabel = UILabel()
    var dateLabel = UILabel()
    var factWeatherView = FactWeatherView()
    var windSpeedView = FactWeatherUnderView()
    var sunriseView = FactWeatherUnderView()
    var sunsetView = FactWeatherUnderView()
    var hoursCollectionView = HoursCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1)
        presenter?.viewDidLoaded()
    }
}



//  MARK: EXTENSION
extension FactWeatherViewController: FactWeatherViewControllerProtocol {
    
    func showWeather(weather: Weather, hoursForCell: WeatherHoursStorage) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.geo_object.locality.name
            self.dateLabel.text = self.formatter.string(from: weather.now)
            self.factWeatherView.temp = weather.fact.temp
            self.factWeatherView.image = weather.fact.condition
            self.windSpeedView.text = String(weather.fact.wind_speed) + " м/c"
            self.sunriseView.text = weather.forecasts.first?.sunrise
            self.sunsetView.text = weather.forecasts.first?.sunset
            self.hoursCollectionView.set(hoursForCell.array)
            
            self.updateDate()
            self.setup()
            
        }
    }

    func setup() {
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
        view.addSubview(factWeatherView)
        factWeatherView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel).inset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(360)
        }
        view.addSubview(windSpeedView)
        windSpeedView.snp.makeConstraints { make in
            make.top.equalTo(factWeatherView).inset(300)
            make.left.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
            make.size.equalTo(110)
        }
        
        
        view.addSubview(sunriseView)
        sunriseView.snp.makeConstraints { make in
            make.top.equalTo(factWeatherView).inset(300)
            make.left.equalTo(windSpeedView).inset(((StructScreenSize().screenWidth - 330) / 4) + 110 )
            make.size.equalTo(110)
        }

        view.addSubview(sunsetView)
        sunsetView.snp.makeConstraints { make in
            make.top.equalTo(factWeatherView).inset(300)
            make.left.equalTo(sunriseView).inset(((StructScreenSize().screenWidth - 330) / 4) + 110 )
            make.size.equalTo(110)
        }
        
        view.addSubview(hoursCollectionView)
        hoursCollectionView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.top.equalTo(sunsetView).inset(100)
            make.left.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
            make.right.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
        }
    }
    
    func updateDate() {
        
        cityLabel.font = UIFont(name: "Menlo-Bold", size: 20)
        cityLabel.textAlignment = .center
        cityLabel.textColor = .white
        
        factWeatherView.setup()
        
        dateLabel.font = UIFont(name: "Menlo", size: 20)
        cityLabel.textAlignment = .center
        dateLabel.textColor = .white
        
        windSpeedView.title = "Ветер"
        windSpeedView.setup()

        sunriseView.title = "Восход"
        sunriseView.setup()

        sunsetView.title = "Закат"
        sunsetView.setup()

        hoursCollectionView.reloadData()
    }
}

