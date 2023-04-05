//
//  WeatherViewModel.swift
//  GoodWeatherSwiftUI
//
//  Created by Òscar Muntal on 5/4/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        guard let temp = weather.temp else { return "" }
        return String(format: "%.0f", temp)
    }
    
    var humidity: String {
        guard let humidity = weather.humidity else { return "" }
        return String(format: "%.0f", humidity)
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
    
}
