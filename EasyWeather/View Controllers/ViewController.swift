//
//  ViewController.swift
//  EasyWeather
//
//  Created by mac on 06.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    
    var alertButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchData(city: "Moscow")
        
        customElevents()

        createConstraints()
        
    }
    
    @objc func serchPressed(_ sender: UIAction) {
        
        presentSerchAlertController(title: "Enter city name", message: nil, style: .alert) { city in
            self.networkManager.fetchData(city: city)
        }
        
    }

    
    func customElevents() {

        // alertButton
        alertButton.layer.cornerRadius = 8
        alertButton.backgroundColor = .systemBlue
        alertButton.setTitle("Hello", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.setTitleColor(.systemGray4, for: .highlighted)
        alertButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        alertButton.addTarget(self, action: #selector(serchPressed), for: .touchUpInside)
        
        view.addSubview(alertButton)

        
    }
    
    func createConstraints() {
        
        // alertButton
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        alertButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }


}

