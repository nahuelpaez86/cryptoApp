//
//  CryptocurrencyRepositoryType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

protocol CryptocurrencyRepositoryType {
    func getAllCryptocurrency() async -> Result<[Cryptocurrency],CriptoCurrencyDomainError>
    func getAllFavoritesCryptocurrencies() async -> Result<[Cryptocurrency], CriptoCurrencyDomainError>
    func getName() -> String
}
