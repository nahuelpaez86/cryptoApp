//
//  FavoriteCryptocurrenciesViewModel.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 11/11/2023.
//

import Foundation

class FavoriteCryptocurrenciesViewModel {
    let cryptocurrencyUseCase: CryptocurrencyUseCaseType
    var allFavouriteCryptocurrencies: [CryptoPresentableItem] = []
    
    var delegate:FavoriteCryptocurrenciesViewModelDelegate?
    
    init(cryptocurrencyUseCase: CryptocurrencyUseCaseType) {
        self.cryptocurrencyUseCase = cryptocurrencyUseCase
    }
    
    func initData() {
        getAllFavorites()
    }
    
    func getAllFavorites() {
        Task {
            let result = await cryptocurrencyUseCase.getAllFavCryptocurrencies()

            guard let allFavs = handleResult(result) else {
                delegate?.error("Error")
                return
            }
            
            allFavouriteCryptocurrencies =  HomeDomainModelToPresentableMapper.execute(allFavs)
            delegate?.successData()
        }
    }
    
}
