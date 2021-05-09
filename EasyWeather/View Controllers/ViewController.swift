//
//  ViewController.swift
//  EasyWeather
//
//  Created by mac on 06.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    
    var searchButton = UIButton()
    var popupButton = UIButton()
    
    var searchTextField = UITextField()
    var searchCityButton = UIButton()
    var cancelButton = UIButton()
    
    let popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
                
        networkManager.fetchData(city: "Moscow")
        
        customElevents()

        createConstraints()
        
    }
    
    //MARK: - Actions
    @objc func searchPressed(_ sender: UIAction) {

        presentSearchAlertController(title: "Enter city name", message: nil, style: .alert) { city in
            self.networkManager.fetchData(city: city)
        }
    }
    
    @objc func searchPressedPopupView(_ sender: UIAction) {
        
        guard let cityName = searchTextField.text else { return }
        if cityName != " " {
            let city = cityName.split(separator: " ").joined(separator: "%20")
            networkManager.fetchData(city: city)
        }
        
        
        UIView.animate(withDuration: 1, delay: 0.3, options: .allowAnimatedContent) {
            self.popupView.transform = CGAffineTransform(translationX: 0, y: -self.popupView.frame.size.height)
        }
    }

    
    @objc func cancelSearch(_ sender: UIAction) {
        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseInOut) {
            self.popupView.transform = CGAffineTransform(translationX: 0, y: self.popupView.frame.size.height)
        }
    }
    
    
    // MARK: - touchesBegan
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseInOut) {
//            self.popupView.transform = CGAffineTransform(translationX: 0, y: self.popupView.frame.size.height)
//        }
//    }
    

    // MARK: - Methods
    func customElevents() {

        // alertButton
        searchButton.layer.cornerRadius = 12
        searchButton.backgroundColor = .systemBlue
        searchButton.setTitle("Hello", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.setTitleColor(.systemGray4, for: .highlighted)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        
        view.addSubview(searchButton)
        
        // popupButton
        popupButton.layer.cornerRadius = 12
        popupButton.backgroundColor = .systemRed
        popupButton.setTitle("Hello View", for: .normal)
        popupButton.setTitleColor(.white, for: .normal)
        popupButton.setTitleColor(.systemGray4, for: .highlighted)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        popupButton.addTarget(self, action: #selector(searchPressedPopupView), for: .touchUpInside)
        
        view.addSubview(popupButton)
        
        // popupView
        popupView.layer.cornerRadius = 12
        view.addSubview(popupView)
        
        // searchTextField
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "City"
        
        popupView.addSubview(searchTextField)
        
        
        // MARK: - PopupView UI Elements
        
        // searchCityButton
        searchCityButton.layer.cornerRadius = 12
        searchCityButton.setTitle(" Search", for: .normal)
        searchCityButton.setTitleColor(.systemBlue, for: .normal)
        searchCityButton.setTitleColor(.systemGray4, for: .highlighted)
        searchCityButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        searchCityButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        searchCityButton.addTarget(self, action: #selector(searchPressedPopupView), for: .touchUpInside)
        
        popupView.addSubview(searchCityButton)
        
        // cancelButton
        cancelButton.layer.cornerRadius = 20
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.systemRed, for: .normal)
        cancelButton.setTitleColor(.systemGray4, for: .highlighted)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        cancelButton.addTarget(self, action: #selector(cancelSearch), for: .touchUpInside)
        
        popupView.addSubview(cancelButton)
        

        
    }
    
    func createConstraints() {
        
        // alertButton
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // viewButton
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        popupButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        popupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        popupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 30).isActive = true
        
        // popupView
        popupView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.size.height / 3).isActive = true
        
        // searchTextField
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchTextField.topAnchor.constraint(equalTo: popupView.topAnchor, constant: view.frame.size.height / 16).isActive = true
        searchTextField.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        
        // searchCityButton
        searchCityButton.translatesAutoresizingMaskIntoConstraints = false
        searchCityButton.centerYAnchor.constraint(equalTo: popupView.centerYAnchor).isActive = true
        searchCityButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        searchCityButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        searchCityButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // cancelButton
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: searchCityButton.bottomAnchor, constant: 20).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }


}

