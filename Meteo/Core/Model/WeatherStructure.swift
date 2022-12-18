//
//  WeatherStructure.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

struct WeatherStructure: Codable {
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
        let humidity: Int
    }
    
    let main: Main
    
    struct Clouds: Codable {
        let all: Double
    }
    
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
}
