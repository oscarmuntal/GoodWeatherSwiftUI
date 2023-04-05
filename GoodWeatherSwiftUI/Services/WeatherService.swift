//
//  WeatherService.swift
//  GoodWeatherSwiftUI
//
//  Created by Òscar Muntal on 5/4/23.
//

import Foundation

class WeatherService {
    let appId = "YOU-APPID-FROM-openweathermap.org"
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appId)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
         
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            guard let weatherResponse = weatherResponse else {
                completion(nil)
                return
            }
            completion(weatherResponse.main)
        }.resume()
    }
}
