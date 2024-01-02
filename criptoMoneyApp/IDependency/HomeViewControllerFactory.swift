//
//  HomeViewControllerBuild.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class HomeViewControllerFactory {
    
    static func build() -> HomeViewController{
        return HomeViewController(viewModel: buildViewModel(),
                                  cryptoDetailCreate: CryptocurrencyDetailViewControllerFactory())
    }
    
    private static func buildViewModel() -> HomeViewModel {
        return HomeViewModel(cryptocurrencyUseCase: buildCryptocurrencyUseCase())
    }
    
    private static func buildCryptocurrencyUseCase() -> CryptocurrencyUseCaseType {
        return CryptocurrencyUseCase(cryptoRepository: buildCryptocurrencyRepository())
    }
    
    private static func buildCryptocurrencyRepository()->CryptocurrencyRepositoryType {
        return CryptocurrencyRepository(dataSource: buildCryptocurrencyDataSource(), domainMapper: CryptocurrencyDomainMapper())
    }
    
    private static func buildCryptocurrencyDataSource() -> CryptocurrencyDataSource {
        return CryptocurrencyDataSource(httpClient: buildHttpClient())
    }
    
    private static func buildHttpClient() -> httpClientType {
        return URLSessionHttpClient(makerEndpoint: URLSessionMakerRequest(), errorResolve: URLSessionErrorResolve())
    }
}
