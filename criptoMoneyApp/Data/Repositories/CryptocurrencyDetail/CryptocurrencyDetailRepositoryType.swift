//
//  CryptocurrencyDetailRepositoryType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

protocol CryptocurrencyDetailRepositoryType {
    func setNewFavourite(_ id: String)
    func getFavoriteStatus(_ id:String) -> Bool
    func removeFavourite(_ id:String)
}
