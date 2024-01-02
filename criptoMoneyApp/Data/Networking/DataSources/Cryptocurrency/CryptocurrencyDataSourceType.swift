//
//  CryptocurrencyDataSource.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

protocol CryptocurrencyDataSourceType {
    func getAll() async -> Result <[CryptocurrencyDTO], HTTPClientError>
    func getAllFavorites() -> [String]
}
