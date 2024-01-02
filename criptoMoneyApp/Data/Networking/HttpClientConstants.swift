//
//  HttpClientConstants.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation


struct HttpClientConstants {
    static let baseUrl = "https://api.coingecko.com/api/v3/"
    static let cointMarketPath = "coins/markets"
    static let paramsCoinMarkets =  [
        "vs_currency":"usd",
        "per_page": 100,
        "page":1,
        "sparkline":false,
        "locale":"en"] as [String : Any]
}

