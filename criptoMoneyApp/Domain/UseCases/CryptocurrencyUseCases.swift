//
//  CriptoUseCases.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation

class CryptocurrencyUseCase: CryptocurrencyUseCaseType {
    let cryptoRepository: CryptocurrencyRepositoryType
    private var cryptocurrencies : [Cryptocurrency] = []
    
    init(cryptoRepository: CryptocurrencyRepositoryType) {
        self.cryptoRepository = cryptoRepository
    }
    
    func getAllCriptos() async -> Result<[Cryptocurrency], CriptoCurrencyDomainError> {
        let result = await cryptoRepository.getAllCryptocurrency()
        
        guard let allCriptocurrencies = try? result.get() else {
            guard case .failure(let error) = result else { // Si viene error, lo guardo.
                return .failure(.generic) // si no viene error, retorno error generico.
            }
            return .failure(error)
        }
        cryptocurrencies = allCriptocurrencies
        return .success(allCriptocurrencies)
    }
    
    func getFirstFourFavCryptocurrencies() async -> Result<[Cryptocurrency], CriptoCurrencyDomainError> {
        let result = await getAllFavCryptocurrencies()
        
        guard let favorites = try? result.get() else {
            return .failure(.generic)
        }
        let firstFourFavorites = Array(favorites.prefix(4))
        return .success(firstFourFavorites)
    }
    
    func getAllFavCryptocurrencies() async -> Result<[Cryptocurrency], CriptoCurrencyDomainError> {
        let allFav = await cryptoRepository.getAllFavoritesCryptocurrencies()
        
        guard let favorites = try? allFav.get() else {
            
            return .failure(.generic)
        }
        
        return .success(favorites)
    }
    
    func getCryptoById(_ id: String) -> Result<Cryptocurrency, CriptoCurrencyDomainError> {
        if let crypto = cryptocurrencies.first(where: { $0.id == id }){
            return .success(crypto)
        } else {
            return.failure(.generic)
        }
    }
    
    func getName() -> String {
        return cryptoRepository.getName()
    }
}
