//
//  Weather.swift
//  GoodWeatherSwiftUI
//
//  Created by Òscar Muntal on 5/4/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
    
}
