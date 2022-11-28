//
//  DataService.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 28.11.2022.
//

import Foundation


class DataService {
    func getData(completion: @escaping (Date) -> Void){
        completion(Date())
    }
}

