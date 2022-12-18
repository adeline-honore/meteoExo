//
//  UIViewController+Extension.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import UIKit

extension UIViewController {
    private func displayAlert(title: String? = nil, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    func popupMessage(element: PopUpMessage) {
        displayAlert(message: element.message)
    }
}
