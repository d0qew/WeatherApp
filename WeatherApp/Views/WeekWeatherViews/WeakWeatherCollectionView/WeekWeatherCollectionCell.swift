//
//  WeakWeatherCollectionCell.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 23.12.2022.
//

import UIKit
import SnapKit

class WeekWeatherCollectionCell: UICollectionViewCell {
    static let reuseId = "WeekWeatherCollectionCell"
    
    var date: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "Menlo", size: 20)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var sunrise: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "Menlo", size: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var sunset: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "Menlo", size: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var wind: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "Menlo", size: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var temp: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .right
        textLabel.font = UIFont(name: "Menlo-Bold", size: 24)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initilaze()
    }
    
    private func initilaze() {
        backgroundColor = UIColor.clear
        layer.cornerRadius = 30
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        
        addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(0)
            make.size.equalTo(120)
        }
        
        addSubview(temp)
        temp.snp.makeConstraints { make in
            make.right.equalTo(mainImageView).inset(130)
            make.centerY.equalToSuperview().inset(0)
        }
        
        addSubview(date)
        date.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.left.equalToSuperview().inset(15)
        }
        
        addSubview(sunrise)
        sunrise.snp.makeConstraints { make in
            make.top.equalTo(date).inset(25)
            make.left.equalToSuperview().inset(15)
        }
        
        addSubview(sunset)
        sunset.snp.makeConstraints { make in
            make.top.equalTo(sunrise).inset(20)
            make.left.equalToSuperview().inset(15)
        }
        
        addSubview(wind)
        wind.snp.makeConstraints { make in
            make.top.equalTo(sunset).inset(20)
            make.left.equalToSuperview().inset(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
