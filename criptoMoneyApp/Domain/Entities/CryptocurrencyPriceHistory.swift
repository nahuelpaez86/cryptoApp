//
//  ChartCryptocurrencies.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

struct CryptocurrencyPriceHistory {
    let prices: [DataPoint]
    
    struct DataPoint{
        let price:Double
        let date: Date
    }
}
