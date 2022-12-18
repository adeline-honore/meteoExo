//
//  ErrorType.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

enum ErrorType: Error {
    case empty
    case network
    case multiDecimal
    case decodingError
}
