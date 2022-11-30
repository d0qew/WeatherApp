//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation


class WeatherService {
   static let shared = WeatherService()
    func getWeather(latitude: Double,longtitude: Double, completion: @escaping (Weather) -> Void) {
        
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast/?lat=\(latitude)&lon=\(longtitude)&lang=ru_RU") else {return}
        var request = URLRequest(url: url)
        request.setValue("ed7c504e-5655-4722-8132-c810f75dc836",
                         forHTTPHeaderField: "X-Yandex-API-Key")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print("test")
            guard let data = data else { return }
            do {
                let weatherInfoJSON = try JSONDecoder().decode(Weather.self, from: data)
                print(weatherInfoJSON.fact.temp)
                completion(weatherInfoJSON)
//                DispatchQueue.main.async {
//                }
            }catch {
                print(error)
            }
        }.resume()
    }
}

