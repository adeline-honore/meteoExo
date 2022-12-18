//
//  WeatherServiceProtocol.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

protocol WeatherServiceProtocol {
    func getData(city: Int, completionHandler: @escaping (Result<WeatherStructure, Error>) -> ())
}
