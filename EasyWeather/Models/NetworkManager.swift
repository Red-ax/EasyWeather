//
//  NetworkManager.swift
//  EasyWeather
//
//  Created by mac on 07.05.2021.
//

import Foundation

class NetworkManager {
    
    var onComplition: ((CurrentWeather) -> Void)?
    
    func fetchData(city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }

            if let currentWeather = self.parseJSON(data: data) {
                self.onComplition?(currentWeather)
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeathyerData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
