//
//  CryptocurrencyDataSource.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation

class CryptocurrencyDataSource: CryptocurrencyDataSourceType {
    private let httpClient : httpClientType
    
    init(httpClient: httpClientType) {
        self.httpClient = httpClient
    }
    
    func getAll() async -> Result<[CryptocurrencyDTO], HTTPClientError> {
        let result = await httpClient.makeRequest(baseUrl: HttpClientConstants.baseUrl, path: HttpClientConstants.cointMarketPath, params: HttpClientConstants.paramsCoinMarkets)
       
        guard case .success(let data) = result else {
            return .failure(.generic)
        }
       
        do {
            let allCryptocurrencies = try JSONDecoder().decode([CryptocurrencyDTO].self, from: data)
            return .success(allCryptocurrencies)
        } catch let error {
            print("Error al decodificar: \(error)")
            return .failure(.generic)
        }
    }
    
    func getAllFavorites() -> [String] {
        if let allFav = UserDefaults.standard.array(forKey: "fav") as? [String] {
            return allFav
        } else {
            return [""]
        }
    }
    
    // Este metodo va a ir a buscar la data al coreData o al servicio.
    private func dataSourceSwitch() { }
}
