//
//  httpClientType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

protocol httpClientType {
    func makeRequest(baseUrl:String,path:String,params:[String:Any]) async -> Result <Data,HTTPClientError>
}
