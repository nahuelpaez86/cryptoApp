//
//  URLSessionMakerRequest.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class URLSessionMakerRequest {
    func url(baseUrl : String , path: String , params: [String : Any]) ->URL? {
        var urlComponents = URLComponents(string: baseUrl + path)
        urlComponents?.queryItems = params.map{ URLQueryItem(name: $0.key, value: $0.value as? String)}
        return urlComponents?.url
    }
}
