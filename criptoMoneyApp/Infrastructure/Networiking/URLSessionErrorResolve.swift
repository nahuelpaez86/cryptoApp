//
//  URLSessionErrorResolve.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class URLSessionErrorResolve {
    
     func resolve(statusCode:Int) -> HTTPClientError {
         print(":::: -- Response by HTTCLInt ERROR STATUS CODE: \(statusCode)" )
        guard statusCode < 500 else { return .clientError }
        return .serverError
    }
    
    func resolve(error: Error ) -> HTTPClientError {
        return .generic
    }
}
