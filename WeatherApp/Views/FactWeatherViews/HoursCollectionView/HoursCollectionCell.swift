//
//  HoursCollectionCell.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 29.11.2022.
//

import UIKit
import SnapKit

class HoursCollectionViewCell: UICollectionViewCell {
    static let reuseId = "HoursCollectionViewCell"
    
    var title: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "Menlo", size: 20)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var temp: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "Menlo-Bold", size: 20)
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
        layer.cornerRadius = 15
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        
        
        addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(2)
            make.size.equalTo(90)
        }
        addSubview(temp)
        temp.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.centerY.equalToSuperview().inset(20)
        }
        
        
        addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
