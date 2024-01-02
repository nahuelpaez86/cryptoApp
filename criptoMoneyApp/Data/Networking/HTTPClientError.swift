//
//  httpClient.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case invalidURL
    case responseError
    case generic
    
}
