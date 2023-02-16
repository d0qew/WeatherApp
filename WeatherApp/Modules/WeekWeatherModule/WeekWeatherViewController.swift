//
//  WeekWeatherViewController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 22.12.2022.
//

import UIKit

protocol WeekWeatherViewControllerProtocol: AnyObject {
    func showWeather(weather: Weather, WeekForCell: WeatherDaysStorage)
}

class WeekWeatherViewController: UIViewController {
    var presenter: WeekWeatherPresenterProtocol?
    var titleLabbel = UILabel()
    var weekCollection = WeekWeatherCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1)
        presenter?.viewDidLoaded()

    }
}

//  MARK: EXTENSION
extension WeekWeatherViewController: WeekWeatherViewControllerProtocol {
    
    func showWeather(weather: Weather, WeekForCell: WeatherDaysStorage) {
        DispatchQueue.main.async {
            self.weekCollection.set(WeekForCell.array)
            
            self.updateDate()
            self.setup()
        }
    }
    
    private func updateDate() {
        
        titleLabbel.font = UIFont(name: "Menlo-Bold", size: 32)
        titleLabbel.textAlignment = .center
        titleLabbel.textColor = .white
        titleLabbel.text = "Неделя"
        
        weekCollection.reloadData()
        
    }
    
    private func setup() {
        view.addSubview(titleLabbel)
        titleLabbel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.left.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
        }
        
        view.addSubview(weekCollection)
        weekCollection.snp.makeConstraints { make in
            make.top.equalTo(titleLabbel).inset(60)
            make.left.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
            make.right.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
            make.bottom.equalToSuperview().inset(100)
        }
    }
}
