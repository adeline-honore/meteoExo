//
//  RouterProtocol.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import Foundation

protocol RouterProtocol {
    var baseURL: String { get }
    func buildParams() -> URL?
    func asUrlRequest() -> URLRequest?
}
