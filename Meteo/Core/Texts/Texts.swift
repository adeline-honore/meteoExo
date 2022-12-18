//
//  Texts.swift
//  Meteo
//
//  Created by HONORE Adeline on 17/12/2022.
//

import Foundation

enum Texts {
    
    case home
    case unlimitedMessage1
    case unlimitedMessage2
    case unlimitedMessage3
    
    
    var value: String {
        switch self {
        case .home:
            return "Bienvenue ! \nVoici votre nouvelle \n appli Météo"
        case .unlimitedMessage1:
            return "Nous téléchargeons les données..."
        case .unlimitedMessage2:
            return "C’est presque fini..."
        case .unlimitedMessage3:
            return "Plus que quelques secondes avant d’avoir le résultat..."
        }
    }
}
