//
//  WeatherStructDecode.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation

struct Weather: Decodable {
    let now: Date
    let geo_object: GeoObject
    let fact: FactWeather
    let forecasts: [WeatherWeek]
}

struct GeoObject: Decodable {
    let locality: Locality
}

struct Locality: Decodable {
    let name: String
}

struct FactWeather: Decodable{
    let temp: Int
    let feels_like: Int
    let condition: String
    let wind_speed: Float
    let daytime: String
}

struct WeatherWeek: Decodable {
    let date: String
    let sunrise: String
    let sunset: String
    let hours: [WeatherOnHours]
}

struct WeatherOnHours: Decodable {
    let hour: String
    let temp: Int
    let condition: String
}


