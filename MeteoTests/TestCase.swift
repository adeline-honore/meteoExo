//
//  TestCase.swift
//  MeteoTests
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

enum TestCase {
    case meteo
    
    var resource: String {
        switch self {
        case .meteo:
            return "Meteo"
        }
    }
}
