//
//  CryptocurrencyDetailRepository.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

class CryptocurrencyDetailRepository:CryptocurrencyDetailRepositoryType {
    private var dataSource : CryptocurrencyDetailDataSourceType
    
    init(dataSource: CryptocurrencyDetailDataSourceType) {
        self.dataSource = dataSource
    }
    
    func setNewFavourite(_ id: String) {
        dataSource.setNewFavorite(id)
    }
    
    func removeFavourite(_ id: String) {
        dataSource.removeFavorite(id)
    }
    
    func getFavoriteStatus(_ id: String) ->Bool {
        return dataSource.getFavoriteStatus(id)
    }
    
}
