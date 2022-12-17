//
//  Texts.swift
//  Meteo
//
//  Created by HONORE Adeline on 17/12/2022.
//

import Foundation

enum Texts {
    
    case home
    
    
    var value: String {
        switch self {
        case .home:
            return "Bienvenue ! \nVoici votre nouvelle \n appli Météo"
        }
    }
}
