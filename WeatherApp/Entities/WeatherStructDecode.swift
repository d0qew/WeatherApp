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
    let forecasts: [WeatherDay]
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

struct WeatherDay: Decodable {
    let date_ts: Date
    let sunrise: String
    let sunset: String
    let parts: Part
    let hours: [WeatherOnHours]
}

struct Part: Decodable {
    let day: Day
}

struct Day: Decodable {
    let temp_avg: Int
    let wind_speed: Double
    let condition: String
}

struct WeatherOnHours: Decodable {
    let hour: String
    let temp: Int
    let condition: String
}
