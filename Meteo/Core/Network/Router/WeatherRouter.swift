//
//  WeatherRouter.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

enum WeatherRouter: RouterProtocol {
    
    var baseURL: String {
        "https://api.openweathermap.org/data/2.5/weather?"
    }
    
    case getWeather(cityID: Int)
    
    func buildParams() -> URL? {
        switch self {
        case .getWeather(let cityID):
            var weatherComponents = URLComponents(string: baseURL)
            
            weatherComponents?.queryItems = [
                URLQueryItem(name: "id", value: String(cityID)),
                URLQueryItem(name: "appid", value: "23b15536e795f12d8cf140cb43b8ab8e")
            ]
            return URL(string: weatherComponents?.string ?? "")
        }
    }
    
    func asUrlRequest() -> URLRequest? {
        guard let url = buildParams() else {
            return nil
        }
        return URLRequest(url: url)
    }
}
