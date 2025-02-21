//
//  WeatherManager.swift
//  Weather
//
//  Created by MII-MAC-21 on 20/2/2568 BE.
//  Copyright © 2568 BE App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=1661c2cc6e510067ad83e3a68050b9ca&units=metric"
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeatehr(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("[Fetch Weather]: " + urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString!)
                    
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let name = decoderData.name
            let descriptionName = decoderData.weather[0].description
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, descriptionName: descriptionName)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
