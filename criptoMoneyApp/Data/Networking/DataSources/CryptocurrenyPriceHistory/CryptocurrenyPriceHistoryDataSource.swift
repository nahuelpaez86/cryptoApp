//
//  CryptocurrenyPriceHistoryDataSource.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation


class CryptocurrenyPriceHistoryDataSource: CryptocurrenyPriceHistoryDataSourceType {
    private let httpClient : httpClientType
    
    init(httpClient: httpClientType) {
        self.httpClient = httpClient
    }
    
    func getHistoryPoints(_ id: String, _ day: Int) async -> Result<CryptocurrenyPriceHistoryDTO, HTTPClientError> {
        // https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1
        
        let path = "coins/\(id)/market_chart"
        let params: [String: Any] = [
            "vs_currency": "usd",
            "days": String(day)
        ]
        
        let result = await httpClient.makeRequest(baseUrl: HttpClientConstants.baseUrl,
                                                  path: path,
                                                  params: params)
       
        guard case .success(let data) = result else {
            return .failure(.generic)
        }
       
        do {
            let result = try JSONDecoder().decode(CryptocurrenyPriceHistoryDTO.self, from: data)
            return .success(result)
        } catch let error {
            print("Error al decodificar: \(error)")
            return .failure(.generic)
        }
    }
}
