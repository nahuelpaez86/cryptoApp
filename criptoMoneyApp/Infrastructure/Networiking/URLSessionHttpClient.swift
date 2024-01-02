//
//  URLSessionHttpClient.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class URLSessionHttpClient: httpClientType {
    private let makerEndpoint : URLSessionMakerRequest
    private let errorResolve: URLSessionErrorResolve
    
    init(makerEndpoint: URLSessionMakerRequest, errorResolve: URLSessionErrorResolve) {
        self.makerEndpoint = makerEndpoint
        self.errorResolve = errorResolve
    }
    
    func makeRequest(baseUrl: String, path: String, params: [String : Any]) async -> Result<Data, HTTPClientError> {
        guard let url = makerEndpoint.url(baseUrl: baseUrl, path: path, params: params) else {
            return .failure(.invalidURL)
        }
        
        let request = URLRequest(url: url)
        
        do {
            let result = try await URLSession.shared.data(for: request)
            
            guard let response = result.1 as? HTTPURLResponse else {
                print(":::: -- Response by HTTCLInt ERROR: \(result)" )
                return .failure(.responseError)
            }
            
            guard response.statusCode == 200 else {
                return .failure(errorResolve.resolve(statusCode: response.statusCode)) // ver otros tipos de errores
            }
            
            return .success(result.0)
        } catch { return .failure(errorResolve.resolve(error: error)) }
    }
}
