//
//  CryptocurrencyDetailDataSourceType.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

protocol CryptocurrencyDetailDataSourceType {
    func setNewFavorite(_ id:String)
    func getFavoriteStatus(_ id:String) -> Bool
    func removeFavorite(_ id:String)
}
