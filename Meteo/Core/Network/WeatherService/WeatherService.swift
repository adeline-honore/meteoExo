//
//  WeatherService.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

class WeatherService: WeatherServiceProtocol {
    
    private var network: NetworkProtocol
        
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func getData(city: Int,completionHandler: @escaping (Result<WeatherStructure, Error>) -> ()) {
        
        network.callNetwork(router: WeatherRouter.getWeather(cityID: city)) { result in
            
            switch result {
            case .success(let data):
                do {
                    let weather = try self.transformToWeather(data: data)
                    completionHandler(.success(weather))
                } catch {
                    completionHandler(.failure(error))
                }
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func transformToWeather(data: Data) throws -> WeatherStructure {
        
        do {
            var responseWeather: WeatherStructure
            let data = data
            responseWeather = try JSONDecoder().decode(WeatherStructure.self, from: data)
            return responseWeather
        } catch {
            throw ErrorType.decodingError
        }
    }
}
