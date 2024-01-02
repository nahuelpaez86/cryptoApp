//
//  CryptocurrencyDetailDataSource.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation


class CryptocurrencyDetailDataSource: CryptocurrencyDetailDataSourceType {
    private let httpClient:httpClientType
    
    init(httpClient: httpClientType) {
        self.httpClient = httpClient
    }
    
    func setNewFavorite(_ id: String) {
        var current = getAllFavs()
        current.append(id)
        UserDefaults.standard.set(current, forKey: "fav")
    }
    
    func removeFavorite(_ id: String) {
        var current = getAllFavs()
        var newArray:[String] = []
        
        current.forEach { currentId in
            if currentId != id {
                newArray.append(currentId)
            }
        }
        
        UserDefaults.standard.set(newArray, forKey: "fav")
    }
    
    func getFavoriteStatus(_ id: String) -> Bool {
        return getAllFavs().contains(id)
    }
    
    private func getAllFavs() -> [String] {
        return UserDefaults.standard.array(forKey: "fav") as? [String] ?? [""]
    }
}
