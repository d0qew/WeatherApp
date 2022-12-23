//
//  WeatherDayClass.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 23.12.2022.
//

import UIKit

class WeatherDayClass {
    
    var date: String
    var sunrise: String
    var sunset: String
    var wind: Double
    var temp: Int
    var condition: String
    
    init(date: String,sunrise: String, sunset: String, wind: Double, temp: Int, condition: String) {
        self.date = date
        self.sunrise = sunrise
        self.sunset = sunset
        self.wind = wind
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

class WeatherDaysStorage {
    var array: [WeatherDayClass] = []
    
    func addNewElement(_ value: WeatherDayClass) {
        array.append(value)
    }
    func clearArray() {
        array.removeAll()
    }
}
