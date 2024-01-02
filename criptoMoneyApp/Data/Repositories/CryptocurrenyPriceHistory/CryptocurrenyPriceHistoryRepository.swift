//
//  CryptocurrenyPriceHistoryRepository.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation
/**
class CryptocurrenyPriceHistoryRepository : CryptocurrenyPriceHistoryRepositoryType {
    private let dataSource : CryptocurrenyPriceHistoryDataSourceType
    private let domainMapper :CryptocurrencyPriceHistoryDomainMapper
    
    init(dataSource: CryptocurrenyPriceHistoryDataSourceType,domainMapper:CryptocurrencyPriceHistoryDomainMapper ) {
        self.dataSource = dataSource
        self.domainMapper = domainMapper
    }
    
    func getPriceHistory(_ id: String, _ day: Int) async -> Result<CryptocurrencyPriceHistory, CriptoCurrencyDomainError> {
        let result = await dataSource.getHistoryPoints(id, day)
        
        guard let response = try? result.get() else {
            return .failure(.generic)
        }
     
        
        /// MARK: - Crear Mapper
        return .success(domainMapper.map(response))
    }
    
}


class CryptocurrencyPriceHistoryDomainMapper {
    
 
    func map(_ priceHistoryDTO :CryptocurrenyPriceHistoryDTO )-> CryptocurrencyPriceHistory {
        
        let prices: [CryptocurrencyPriceHistory.DataPoint] = priceHistoryDTO.prices.compactMap { dataPoint in
        
            guard dataPoint.count >= 2,
                  let date = timeTampToDate(dataPoint[0]),
                  ///let price = dataPoint[1].isNaN.else { return nil }
                  let price = 2000.0 else { return }
            return CryptocurrencyPriceHistory.DataPoint(price: price, date: date)
        }
        
        return CryptocurrencyPriceHistory(prices: prices)
    }
    
    private func timeTampToDate(_ timeTamp: Double) -> Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.year], from: Date(timeIntervalSince1970: timeTamp / 1000))

        guard let date = calendar.date(from: components) else { return nil }
        return date
    }
}
 **/
