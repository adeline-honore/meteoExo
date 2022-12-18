//
//  PopUpMessage.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

enum PopUpMessage {
    case noData
    case decodingError
    
    var message: String {
        switch self {
        case .noData:
            return "Oups ! Aucune donnée téléchargée."
        case .decodingError:
            return "Oups ! Un souci réseau est apparu."
        }
    }
}
