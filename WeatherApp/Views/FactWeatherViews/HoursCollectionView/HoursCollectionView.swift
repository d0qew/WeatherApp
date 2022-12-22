//
//  HoursCollectionView.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 29.11.2022.
//

import UIKit

class HoursCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [WeatherHour]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        backgroundColor = UIColor.clear
        delegate = self
        dataSource = self
        register( HoursCollectionViewCell.self, forCellWithReuseIdentifier: HoursCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        alwaysBounceHorizontal = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
      
    }
    
    func set(_ cells:[WeatherHour]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier:  HoursCollectionViewCell.reuseId, for: indexPath) as! HoursCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].setIconWeather()
        cell.title.text = cells[indexPath.row].hour + ":00"
        cell.temp.text = String(cells[indexPath.row].temp) + "\u{2103}"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 120)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var hoursCollectionView = HoursCollectionViewCell()
