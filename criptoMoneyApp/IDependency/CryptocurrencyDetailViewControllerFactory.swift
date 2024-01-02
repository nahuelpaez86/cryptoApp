//
//  CryptocurrencyDetailViewControllerFactory.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

protocol CryptocurrencyDetailViewControllerFactoryType {
    func build(_ information: CryptoPresentableItem) -> CryptocurrencyDetailViewController
}

class CryptocurrencyDetailViewControllerFactory:CryptocurrencyDetailViewControllerFactoryType {
    func build(_ information: CryptoPresentableItem) -> CryptocurrencyDetailViewController {
        return CryptocurrencyDetailViewController(viewModel: buildViewModel(information: information))
    }
    
    private func buildViewModel(information: CryptoPresentableItem) -> CryptocurrencyDetailViewModel {
        return CryptocurrencyDetailViewModel(cryptocurrencyInformation: information, cryptocurrencyDetailUseCase: buildCryptocurrencyUseCase())
    }
    
    private func buildCryptocurrencyUseCase() -> CryptocurrencyDetailUseCaseType {
        return CryptocurrencyDetailUseCase(repository: buildCryptocurrencyRepository())
    }
    
    private func buildCryptocurrencyRepository()->CryptocurrencyDetailRepositoryType {
        return CryptocurrencyDetailRepository(dataSource: buildCryptocurrencyDataSource()) // Agregar despues mapper para points
    }
    
    private func buildCryptocurrencyDataSource() -> CryptocurrencyDetailDataSource {
        return CryptocurrencyDetailDataSource(httpClient: buildHttpClient())
    }
    
    private func buildHttpClient() -> httpClientType {
        return URLSessionHttpClient(makerEndpoint: URLSessionMakerRequest(), errorResolve: URLSessionErrorResolve())
    }
}
