//
//  CryptocurrencyDomainMapper.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class CryptocurrencyDomainMapper {
    
     func mapDTOToDomain(_ dto: CryptocurrencyDTO) -> Cryptocurrency {
            return Cryptocurrency(
                id: dto.id,
                symbol: dto.symbol,
                name: dto.name,
                image: dto.image,
                currentPrice: String(dto.currentPrice),
                marketCap: String(dto.marketCap),
                totalVolume: String(dto.totalVolume),
                lastUpdated: String(dto.lastUpdated)
            )
        }
        
    func mapDTOArrayToDomain(_ dtoArray: [CryptocurrencyDTO]) -> [Cryptocurrency] {
            return dtoArray.map { mapDTOToDomain($0) }
        }
}
