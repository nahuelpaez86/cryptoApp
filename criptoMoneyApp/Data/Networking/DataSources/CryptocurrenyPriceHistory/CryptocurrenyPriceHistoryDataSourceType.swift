//
//  CryptocurrenyPriceHistoryDataSourceType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

protocol CryptocurrenyPriceHistoryDataSourceType {
    func getHistoryPoints(_ id: String , _ day: Int) async -> Result <CryptocurrenyPriceHistoryDTO,HTTPClientError>
}
