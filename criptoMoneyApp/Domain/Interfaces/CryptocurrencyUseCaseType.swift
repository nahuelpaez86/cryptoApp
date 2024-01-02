//
//  CryptocurrencyUseCaseType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

protocol CryptocurrencyUseCaseType {
    func getAllCriptos() async->Result <[Cryptocurrency],CriptoCurrencyDomainError>
    func getAllFavCryptocurrencies() async -> Result <[Cryptocurrency],CriptoCurrencyDomainError>
    func getFirstFourFavCryptocurrencies() async -> Result <[Cryptocurrency],CriptoCurrencyDomainError>
    func getName() -> String
}
