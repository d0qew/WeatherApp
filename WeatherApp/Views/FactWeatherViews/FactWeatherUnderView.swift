//
//  FactWeatherUnderView.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 30.11.2022.
//

import UIKit
import SnapKit

class FactWeatherUnderView: UIView {
    var title: String?
    var text: String?
    
    let labelTitle = UILabel()
    let labelValue = UILabel()

    required init(title: String? = nil, text: String? = nil) {
        self.title = title
        self.text = text
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        labelTitle.text = title! + ":"
        labelTitle.font = UIFont(name: "Menlo", size: 20)
        labelTitle.textColor = .white
        self.addSubview(labelTitle)
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        
        labelValue.text = text!
        labelValue.font = UIFont(name: "Menlo-Bold", size: 20)
        labelValue.textColor = .white
        self.addSubview(labelValue)
        
        labelValue.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelTitle).inset(40)
        }
    }
}
