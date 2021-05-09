//
//  Weather.swift
//  EasyWeather
//
//  Created by mac on 10.05.2021.
//

import Foundation

struct Weather {
    
    let coord: Coord
    let weather: WeatherElement
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let name: String
    let cod: Int
    
}

struct Coord {
    let lon: Double
    let lat: Double
}

struct WeatherElement {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind {
    let speed: Int
    let deg: Int
}

struct Clouds {
    let all: Int
}

struct Sys {
    let type: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
