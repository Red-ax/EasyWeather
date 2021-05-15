//
//  NetworkManager.swift
//  EasyWeather
//
//  Created by mac on 07.05.2021.
//

import Foundation
import CoreLocation

class NetworkManager {
    
    enum RequestType {
        case cityName(cityName: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onComplition: ((CurrentWeather) -> Void)?
    
    
    func fetchData(requestType: RequestType) {
        
        var urlString = ""
        
        switch requestType {
        case .cityName(cityName: let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
            
        case .coordinate(latitude: let latitude, longitude: let longitude):
//            urlString = "https://api.openweathermap.org/data/2.5/weather?\(latitude)=35&\(longitude)=139&appid=\(apiKey)&units=metric"
            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        }
        
        performRequest(urlString: urlString)
        
    }
 
    
    fileprivate func performRequest(urlString: String) {
        
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
    
    
    fileprivate func parseJSON(data: Data) -> CurrentWeather? {
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
