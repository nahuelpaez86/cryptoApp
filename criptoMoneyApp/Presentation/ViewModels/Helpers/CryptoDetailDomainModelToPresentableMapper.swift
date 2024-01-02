//
//  CryptoDetailDomainModelToPresentableMapper.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

class CryptoDetailDomainModelToPresentableMapper {
    static func execute(_ domainModelData: CryptoPresentableItem,_ isFav:String) -> [CryptoPresentableItemDetails] {
        return createDetail(domainModelData,isFav)
    }
    
    private static func createDetail(_ information: CryptoPresentableItem,_ isFav:String) -> [CryptoPresentableItemDetails] {
        return [ CryptoPresentableItemDetails(title: "id", description: information.id),
                 CryptoPresentableItemDetails(title: "Symbol", description: information.symbol),
                 CryptoPresentableItemDetails(title: "Name", description: information.name),
                 CryptoPresentableItemDetails(title: "image", description: information.image),
                 CryptoPresentableItemDetails(title: "MarketCup", description: information.marketCap),
                 CryptoPresentableItemDetails(title: "Price", description: information.currentPrice),
                 CryptoPresentableItemDetails(title: "Total volume", description: information.totalVolume),
                 CryptoPresentableItemDetails(title: "fav", description: isFav)]
    }
}
