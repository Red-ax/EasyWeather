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
    var popupButton = UIButton()
    
    let popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
                
        networkManager.fetchData(city: "Moscow")
        
        customElevents()

        createConstraints()
        
    }
    
    //MARK: - Actions
    @objc func serchPressed(_ sender: UIAction) {
        
        presentSerchAlertController(title: "Enter city name", message: nil, style: .alert) { city in
            self.networkManager.fetchData(city: city)
        }
    }
    
    @objc func serchPressedPopupView(_ sender: UIAction) {
        
        UIView.animate(withDuration: 1, delay: 0.3, options: .allowAnimatedContent) {
            self.popupView.transform = CGAffineTransform(translationX: 0, y: -self.popupView.frame.size.height)
        }
    }
    
    
    // MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseInOut) {
            self.popupView.transform = CGAffineTransform(translationX: 0, y: self.popupView.frame.size.height)
        }
    }
    

    // MARK: - Methods
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
        
        // alertButton
        popupButton.layer.cornerRadius = 8
        popupButton.backgroundColor = .systemRed
        popupButton.setTitle("Hello View", for: .normal)
        popupButton.setTitleColor(.white, for: .normal)
        popupButton.setTitleColor(.systemGray4, for: .highlighted)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        popupButton.addTarget(self, action: #selector(serchPressedPopupView), for: .touchUpInside)
        
        view.addSubview(popupButton)
        
        // actionView
        popupView.layer.cornerRadius = 12
        view.addSubview(popupView)
        

        
    }
    
    func createConstraints() {
        
        // alertButton
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        alertButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // viewButton
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        popupButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        popupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        popupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupButton.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: 60).isActive = true
        
        // actionView
        popupView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.size.height / 2).isActive = true

    }


}

