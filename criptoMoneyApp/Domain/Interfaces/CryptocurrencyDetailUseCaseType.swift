//
//  CryptocurrencyDetailUseCaseType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

protocol CryptocurrencyDetailUseCaseType {
    func setNewFavoriteCryptocurrency(_ id:String)
    func getFavoriteStatus(_ id:String) ->Bool
    func removeFavoriteCryptocurrency(_ id:String)
}
