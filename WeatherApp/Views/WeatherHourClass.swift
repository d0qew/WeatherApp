//
//  WeatherHour.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 29.11.2022.
//

import UIKit

class WeatherHour {
    var hour: String
    var temp: Int
    var condition: String
    
    init(hour: String, temp: Int, condition: String) {
        self.hour = hour
        self.temp = temp
        self.condition = condition
    }
    
    func setIconWeather() -> UIImage {
        switch condition {
            
            //ясно
        case "clear":
            return UIImage(named: "clear")!
            
            //малооблачно
        case "partly-cloudy":
            return UIImage(named: "partly-cloudy")!
            
            //облачно с прояснениями
        case "cloudy":
            return UIImage(named: "cloudy")!

            //пасмурно
        case "overcast":
            return UIImage(named: "overcast")!

            //морось
        case "drizzle":
            return UIImage(named: "drizzle")!

            //небольшой дождь
        case "light-rain":
            return UIImage(named: "light-rain")!

            //дождь
        case "rain":
            return UIImage(named: "rain")!

            //умеренно сильный дождь
        case "moderate-rain":
            return UIImage(named: "moderate-rain")!

            //сильный дождь
        case "heavy-rain":
            return UIImage(named: "heavy-rain")!

            // длительный сильный дождь
        case "continuous-heavy-rain":
            return UIImage(named: "continuous-heavy-rain")!

            //ливень
        case "showers":
            return UIImage(named: "showers")!
            
            //дождь со снегом
        case "wet-snow":
            return UIImage(named: "wet-snow")!

            //небольшой снег
        case "light-snow":
            return UIImage(named: "light-snow")!

            //снег
        case "snow":
            return UIImage(named: "snow")!

            //снегопад
        case "snow-showers":
            return UIImage(named: "snow-showers")!

            //град
        case "hail":
            return UIImage(named:"hail")!
            //гроза
        case "thunderstorm":
            return UIImage(named:"thunderstorm")!

            //дождь с грозой
        case "thunderstorm-with-rain":
            return UIImage(named:"thunderstorm-with-rain")!

            //гроза с градом
        case "thunderstorm-with-hail":
            return UIImage(named:"thunderstorm-with-hail")!

            //какая-либо ошибка, кидает пустуе изображение
        default:
            return UIImage()
        }
    }

}

class WeatherHoursStorage {
    var array: [WeatherHour] = []
    
    func addNewElement(_ value: WeatherHour) {
        array.append(value)
    }
    func clearArray() {
        array.removeAll()
    }
}



