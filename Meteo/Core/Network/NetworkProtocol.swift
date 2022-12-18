//
//  NetworkProtocol.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

protocol NetworkProtocol {
    func callNetwork(router: RouterProtocol, completionHandler: @escaping (Result<Data, Error>) -> ())
}
