//
//  CriptoRepository.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation

class CryptocurrencyRepository: CryptocurrencyRepositoryType {
    private let dataSource: CryptocurrencyDataSourceType
    private let domainMapper: CryptocurrencyDomainMapper
    private var cryptocurrencies:[Cryptocurrency] = []
    
    init(dataSource: CryptocurrencyDataSourceType , domainMapper:CryptocurrencyDomainMapper) {
        self.dataSource = dataSource
        self.domainMapper = domainMapper
    }

    func getAllCryptocurrency() async -> Result<[Cryptocurrency], CriptoCurrencyDomainError> {
        let result = await dataSource.getAll()
        
        // esta línea de código intenta obtener un valor de result.get() y, si tiene éxito, lo asigna a la constante response.
        // Si falla, se ejecuta el código de manejo de errores
        // try? me convierte el resultado en un opcional, si es success, me da el valor, si es failure, me pone nil.
        guard let response = try? result.get() else {
            return .failure(.generic)
        }
        
        let cryptocurrenciesDomain = domainMapper.mapDTOArrayToDomain(response)
        cryptocurrencies = cryptocurrenciesDomain
        return .success(cryptocurrenciesDomain )
    }
    
    func getAllFavoritesCryptocurrencies() async -> Result<[Cryptocurrency], CriptoCurrencyDomainError> {
        let allFavorites = dataSource.getAllFavorites()
        if cryptocurrencies.isEmpty {
            let allCryptocurrencies = await getAllCryptocurrency()
        
            guard let response = try? allCryptocurrencies.get() else {
                return .failure(.generic)
            }
            
            return .success(response.filter({ allFavorites.contains($0.id)}))
        } else {
            return .success(cryptocurrencies.filter({ allFavorites.contains($0.id)}))
        }
    }
    
    func getName() -> String {
        if let name = UserDefaults.standard.string(forKey: "userName") {
          return name
        } else {
            return "Desconocido"
        }
    }
}
