//
//  CryptoCurriencyDTO.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation


struct CryptocurrencyDTO: Decodable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap: Int
    let totalVolume:Double
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case lastUpdated = "last_updated"
    }
}
