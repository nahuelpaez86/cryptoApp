//
//  CryptocurrenyPriceHistoryDTO.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

struct CryptocurrenyPriceHistoryDTO: Codable {
    let prices: [[Double]]
    
    enum CodingKeys: String , CodingKey {
        case prices 
    }
}
