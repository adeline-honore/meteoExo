//
//  Network.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

class Network: NetworkProtocol {
    func callNetwork(router: RouterProtocol, completionHandler: @escaping (Result<Data, Error>) -> ()) {
        guard let urlRequest = router.asUrlRequest() else {
            completionHandler(.failure(ErrorType.network))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if error != nil {
                completionHandler(.failure(error!))
            }
            completionHandler(.success(data))
        }.resume()
    }
}
