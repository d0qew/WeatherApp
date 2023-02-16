//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation


class WeatherService {
   static let shared = WeatherService()
    func getWeather(latitude: Double,longitude: Double, completion: @escaping (Weather) -> Void) {
        
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast/?lat=\(latitude)&lon=\(longitude)&lang=ru_RU") else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("a831f036-0f34-4ef4-b62f-5f2060e7be0e",
                         forHTTPHeaderField: "X-Yandex-API-Key")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let weatherInfoJSON = try JSONDecoder().decode(Weather.self, from: data)
                completion(weatherInfoJSON)
            }catch {
                print(error)
            }
        }.resume()
    }
}

