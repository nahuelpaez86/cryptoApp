//
//  HomeViewModel.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class HomeViewModel {
    private let cryptocurrencyUseCase : CryptocurrencyUseCaseType
    var cryptocurriencys : [CryptoPresentableItem] = []
    var favCryptocurriencys : [CryptoPresentableItem] = []
    
    var delegate:HomeViewModelDelegate?
    
    init(cryptocurrencyUseCase: CryptocurrencyUseCaseType) {
        self.cryptocurrencyUseCase = cryptocurrencyUseCase
    }
    
    func initData() {
        getCryptocurrencies()
    }
    
    func getName() -> String {
        return cryptocurrencyUseCase.getName()
    }
    
    func getFirstFourFavCryptocurrencies() {
        Task {
            let result = await cryptocurrencyUseCase.getFirstFourFavCryptocurrencies()
            guard let response = handleResult(result) else {
                  delegate?.error(message:"Error al pedir todas las criptomonedas favoritas")
             return }
            favCryptocurriencys = HomeDomainModelToPresentableMapper.execute(response)
            delegate?.successData()
        }
    }
    
    private func getCryptocurrencies() {
        Task {
            let result = await cryptocurrencyUseCase.getAllCriptos()

            guard let response = handleResult(result) else {
                delegate?.error(message: "Error al pedir todas las criptomonedas")
                return }
            cryptocurriencys = HomeDomainModelToPresentableMapper.execute(response)
            getFirstFourFavCryptocurrencies()
        }
    }
  
}
