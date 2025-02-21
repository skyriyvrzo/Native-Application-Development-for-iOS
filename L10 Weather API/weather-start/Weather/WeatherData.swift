//
//  WeatherData.swift
//  Weather
//
//  Created by MII-MAC-21 on 20/2/2568 BE.
//  Copyright © 2568 BE App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
