//
//  CryptocurrenyPriceHistoryRepositoryType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

protocol CryptocurrenyPriceHistoryRepositoryType {
    func getPriceHistory(_ id: String, _ day: Int) async ->Result<CryptocurrencyPriceHistory, CriptoCurrencyDomainError>
}
