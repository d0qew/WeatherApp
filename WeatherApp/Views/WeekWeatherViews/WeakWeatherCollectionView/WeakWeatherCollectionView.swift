//
//  WeakWeatherCollectionView.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 23.12.2022.
//

import UIKit

class WeekWeatherCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [WeatherDayClass]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        backgroundColor = UIColor.clear
        delegate = self
        dataSource = self
        register( WeekWeatherCollectionCell.self, forCellWithReuseIdentifier: WeekWeatherCollectionCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
//        alwaysBounceHorizontal = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
      
    }
    
    func set(_ cells:[WeatherDayClass]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier:  WeekWeatherCollectionCell.reuseId, for: indexPath) as! WeekWeatherCollectionCell
        
        cell.date.text = cells[indexPath.row].date
        cell.mainImageView.image = cells[indexPath.row].setIconWeather()
        cell.temp.text = String(cells[indexPath.row].temp) + "\u{2103}"
        cell.sunrise.text = "Восход: " + cells[indexPath.row].sunrise
        cell.sunset.text = "Закат: " + cells[indexPath.row].sunset
        cell.wind.text = "Ветер: " + String(cells[indexPath.row].wind) + " м/с"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 120)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

