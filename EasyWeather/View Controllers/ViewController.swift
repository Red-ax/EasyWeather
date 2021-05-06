//
//  ViewController.swift
//  EasyWeather
//
//  Created by mac on 06.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchData(city: "Moscow")
        
    }


}

