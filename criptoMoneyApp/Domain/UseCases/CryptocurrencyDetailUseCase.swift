//
//  CryptocurrencyDetailUseCase.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

class CryptocurrencyDetailUseCase: CryptocurrencyDetailUseCaseType {
    private var repository : CryptocurrencyDetailRepositoryType
    
    init(repository: CryptocurrencyDetailRepositoryType) {
        self.repository = repository
    }
    
    func setNewFavoriteCryptocurrency(_ id: String) {
        repository.setNewFavourite(id)
    }
    
    func removeFavoriteCryptocurrency(_ id: String) {
        repository.removeFavourite(id)
    }
    
    func getFavoriteStatus(_ id: String) -> Bool {
        return repository.getFavoriteStatus(id)
    }
}
