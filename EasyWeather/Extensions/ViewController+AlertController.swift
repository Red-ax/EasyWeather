//
//  ViewController+AlertController.swift
//  EasyWeather
//
//  Created by mac on 07.05.2021.
//

import Foundation
import UIKit

extension ViewController {
    
    func presentSerchAlertController(title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        alert.addTextField { tf in
            tf.placeholder = "City"
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            
            if cityName != " " {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(cityName)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}
