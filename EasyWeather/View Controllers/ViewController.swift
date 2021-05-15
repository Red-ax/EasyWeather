//
//  ViewController.swift
//  EasyWeather
//
//  Created by mac on 06.05.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestAlwaysAuthorization()
        return lm
    }()
    
    var weatherIconImageView = UIImageView()
    var cityLabel = UILabel()
    var temperatureLabel = UILabel()
    var feelsLikeTemperatureLabel = UILabel()
    
    
    var searchButton = UIButton(type: .system)
//    var popupButton = UIButton()
    
//    var searchTextField = UITextField()
//    var searchCityButton = UIButton()
//    var cancelButton = UIButton()
//
//    let popupView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        customElevents()

        createConstraints()
        
        networkManager.onComplition = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterface(weather: currentWeather)
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        
    }
    
    //MARK: - Actions
    @objc func searchPressed(_ sender: UIAction) {

        presentSearchAlertController(title: "Enter city name", message: nil, style: .alert) { [weak self] city in
            guard let self = self else { return }
            self.networkManager.fetchData(requestType: .cityName(cityName: city))
        }
    }
    
    
//    @objc func searchPressedPopupView(_ sender: UIAction) {
//
//        guard let cityName = searchTextField.text else { return }
//        if cityName != " " {
//            let city = cityName.split(separator: " ").joined(separator: "%20")
//            networkManager.fetchData(city: city)
//        }
//
//
//        UIView.animate(withDuration: 1, delay: 0.3, options: .allowAnimatedContent) {
//            self.popupView.transform = CGAffineTransform(translationX: 0, y: -self.popupView.frame.size.height)
//        }
//    }

    
//    @objc func cancelSearch(_ sender: UIAction) {
//        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseInOut) {
//            self.popupView.transform = CGAffineTransform(translationX: 0, y: self.popupView.frame.size.height)
//        }
//    }
    
    
    // MARK: - touchesBegan
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseInOut) {
//            self.popupView.transform = CGAffineTransform(translationX: 0, y: self.popupView.frame.size.height)
//        }
//    }
    

    // MARK: - Methods
    
    func updateInterface(weather: CurrentWeather) {
        
        DispatchQueue.main.async {
            self.weatherIconImageView.image = UIImage(systemName: weather.systenIconeNameString)
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString + "°"
            self.feelsLikeTemperatureLabel.text = "Fells like " + weather.feelsLikeTemperatureString + "°"
        }
        
    }

}


// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitudde = location.coordinate.longitude
        
        networkManager.fetchData(requestType: .coordinate(latitude: latitude, longitude: longitudde))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

