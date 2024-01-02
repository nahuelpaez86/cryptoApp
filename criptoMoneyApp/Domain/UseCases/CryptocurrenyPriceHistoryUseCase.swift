//
//  CryptocurrenyPriceHistoryUseCase.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

/*
class CryptocurrenyPriceHistoryUseCase : CryptocurrenyPriceHistoryUseCaseType {
    /*private let repository : CryptocurrenyPriceHistoryRepositoryType
    
    init(repository: CryptocurrenyPriceHistoryRepositoryType) {
        self.repository = repository
    }
    
    func getPriceHistory(_ id: String, _ day: Int) async -> Result<CryptocurrencyPriceHistory, CriptoCurrencyDomainError> {
        /**
         
        let result =  await repository.getPriceHistory(id, day)
        
        guard let priceHistory = try? result.get() else {
            
            return .failure(.generic)
        }
        
        return .success(favorites)**/
        return .success(CryptocurrencyPriceHistory(prices: <#[CryptocurrencyPriceHistory.DataPoint]#>))
    }
     }*/*/
