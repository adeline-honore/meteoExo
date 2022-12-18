//
//  City.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

enum City {
    
    case city10
    case city20
    case city30
    case city40
    case city50
    
    var cityName: String {
        switch self {
        case .city10:
            return "Rennes"
        case .city20:
            return "Paris"
        case .city30:
            return "Nantes"
        case .city40:
            return "Bordeaux"
        case .city50:
            return "Lyon"
        }
    }
}
