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
        
    }
    
    @objc func serchPressed(_ sender: UIAction) {
        
        presentSerchAlertController(title: "Enter city name", message: nil, style: .alert) { city in
            self.networkManager.fetchData(city: city)
        }
        
    }
    
    func customElevents() {
        
        alertButton = UIButton(frame: CGRect(x: Int(view.frame.size.width / 2 - 90), y: Int(view.frame.size.height / 2 - 30), width: 180, height: 60))
        alertButton.frame.size.height = 60
        alertButton.frame.size.width = 180
        alertButton.layer.cornerRadius = 8
        alertButton.backgroundColor = .systemBlue
        alertButton.setTitle("Hello", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.setTitleColor(.systemGray4, for: .highlighted)
        alertButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        alertButton.addTarget(self, action: #selector(serchPressed), for: .touchUpInside)
        
        view.addSubview(alertButton)
        
    }


}

