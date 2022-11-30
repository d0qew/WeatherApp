//
//  FactWeatherView.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 30.11.2022.
//

import UIKit
import SnapKit


class FactWeatherView: UIView {
    var image: String?
    var temp: Int?
    
    let imageViewWeather = UIImageView()
    let labelTemp = UILabel()

    required init(image: String? = nil, temp: Int? = nil) {
        self.image = image
        self.temp = temp
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .clear
        
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        if temp != nil && temp != nil{
            imageViewWeather.image = UIImage(named: image!)
            self.addSubview(imageViewWeather)
            imageViewWeather.snp.makeConstraints { make in
                make.size.equalTo(200)
                make.left.equalToSuperview().inset(20)
                make.centerY.equalToSuperview().inset(20)
                
            }
            
            labelTemp.text = String(temp!) + "\u{2103}"
            labelTemp.font = UIFont(name: "Menlo-Bold", size: 50)
            labelTemp.textColor = .white
            self.addSubview(labelTemp)
            
            labelTemp.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().inset(20)
                
            }
        }
    }
}
