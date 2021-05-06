//
//  NetworkManager.swift
//  EasyWeather
//
//  Created by mac on 07.05.2021.
//

import Foundation

class NetworkManager {
    
    func fetchData(city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let dataString = String(data: data, encoding: .utf8)
            print(dataString!)
        }
        task.resume()
        
        
        
    }
    
}
