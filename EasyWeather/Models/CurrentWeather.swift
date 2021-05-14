//
//  CurrentWeather.swift
//  EasyWeather
//
//  Created by mac on 10.05.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return "\(Int(temperature.rounded()))"
    }
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "\(Int(feelsLikeTemperature.rounded()))"
    }
    let conditionCode: Int
    var systenIconeNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.max.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign "
        }
    }
    
    init?(currentWeathyerData: CurrentWeatherData) {
        cityName = currentWeathyerData.name
        temperature = currentWeathyerData.main.temp
        feelsLikeTemperature = currentWeathyerData.main.feelsLike
        conditionCode = currentWeathyerData.weather.first!.id
    }
}
