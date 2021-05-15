//
//  ViewController+UIandConstraints.swift
//  EasyWeather
//
//  Created by mac on 14.05.2021.
//

import UIKit

extension ViewController {
    
    func customElevents() {
        
        
        // -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
        
        // view
        view.backgroundColor = #colorLiteral(red: 0.1182275308, green: 0.1272262269, blue: 0.1407499593, alpha: 1)
        
        // weatherIconImageView
        weatherIconImageView.image = UIImage(systemName: "nosign")
        weatherIconImageView.contentMode = .scaleAspectFit
        weatherIconImageView.tintColor = .white
        view.addSubview(weatherIconImageView)
        
        // temperatureLabel
        temperatureLabel.text = "0°"
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont.systemFont(ofSize: 64)
        view.addSubview(temperatureLabel)
        
        // feelsLikeTemperatureLabel
        feelsLikeTemperatureLabel.text = "Feels like temperature 0°"
        feelsLikeTemperatureLabel.textColor = .white
        feelsLikeTemperatureLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(feelsLikeTemperatureLabel)
        
        // cityLabel
        cityLabel.text = "Not city"
        cityLabel.textColor = .white
        cityLabel.font = UIFont.boldSystemFont(ofSize: 32)
        view.addSubview(cityLabel)
        

        // searchButton
        searchButton.layer.cornerRadius = 4
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        searchButton.setBackgroundImage( UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        
        view.addSubview(searchButton)
        
        
        
        
        //    / -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
        
        // popupButton
//        popupButton.layer.cornerRadius = 12
//        popupButton.backgroundColor = .systemRed
//        popupButton.setTitle("Hello View", for: .normal)
//        popupButton.setTitleColor(.white, for: .normal)
//        popupButton.setTitleColor(.systemGray4, for: .highlighted)
//        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
//
//        popupButton.addTarget(self, action: #selector(searchPressedPopupView), for: .touchUpInside)
//
//        view.addSubview(popupButton)
        
        // popupView
//        popupView.layer.cornerRadius = 12
//        view.addSubview(popupView)
        
        // searchTextField
//        searchTextField.borderStyle = .roundedRect
//        searchTextField.placeholder = "City"
        
//        popupView.addSubview(searchTextField)
        
        
        // MARK: - PopupView UI Elements
        
        // searchCityButton
//        searchCityButton.layer.cornerRadius = 12
//        searchCityButton.setTitle(" Search", for: .normal)
//        searchCityButton.setTitleColor(.systemBlue, for: .normal)
//        searchCityButton.setTitleColor(.systemGray4, for: .highlighted)
//        searchCityButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
//
//        searchCityButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
//
//        searchCityButton.addTarget(self, action: #selector(searchPressedPopupView), for: .touchUpInside)
//
//        popupView.addSubview(searchCityButton)
        
        // cancelButton
//        cancelButton.layer.cornerRadius = 20
//        cancelButton.setTitle("Cancel", for: .normal)
//        cancelButton.setTitleColor(.systemRed, for: .normal)
//        cancelButton.setTitleColor(.systemGray4, for: .highlighted)
//        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
//
//        cancelButton.addTarget(self, action: #selector(cancelSearch), for: .touchUpInside)
//
//        popupView.addSubview(cancelButton)
        

        
    }
    
    func createConstraints() {
        
        // weatherIconImageView
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherIconImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        weatherIconImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        weatherIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        // temperatureLabel
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 15).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 50).isActive = true
        
        // feelsLikeTemperatureLabel
        feelsLikeTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        feelsLikeTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20).isActive = true
        
        // feelsLikeTemperatureLabel
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.rightAnchor.constraint(equalTo: searchButton.leftAnchor, constant: -10).isActive = true
        cityLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        // alertButton
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        // viewButton
//        popupButton.translatesAutoresizingMaskIntoConstraints = false
//        popupButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
//        popupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        popupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        popupButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 30).isActive = true
        
        // popupView
//        popupView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        popupView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
//        popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.size.height / 3).isActive = true
        
        // searchTextField
//        searchTextField.translatesAutoresizingMaskIntoConstraints = false
//        searchTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5).isActive = true
//        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        searchTextField.topAnchor.constraint(equalTo: popupView.topAnchor, constant: view.frame.size.height / 16).isActive = true
//        searchTextField.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        
        // searchCityButton
//        searchCityButton.translatesAutoresizingMaskIntoConstraints = false
//        searchCityButton.centerYAnchor.constraint(equalTo: popupView.centerYAnchor).isActive = true
//        searchCityButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
//        searchCityButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
//        searchCityButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // cancelButton
//        cancelButton.translatesAutoresizingMaskIntoConstraints = false
//        cancelButton.topAnchor.constraint(equalTo: searchCityButton.bottomAnchor, constant: 20).isActive = true
//        cancelButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
//        cancelButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
//        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
}
