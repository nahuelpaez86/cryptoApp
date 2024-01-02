//
//  domainModelToPresentableMapper.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 12/11/2023.
//

import Foundation

struct CryptoPresentableItem {
    let id :String
    let symbol:String
    let name:String
    let image:String
    let currentPrice:String
    let marketCap:String
    let totalVolume:String
    let lastUpdated:String
    
    init(domainModel:Cryptocurrency) {
        self.id = domainModel.id
        self.symbol = domainModel.symbol
        self.name = domainModel.name
        self.image = domainModel.image
        self.currentPrice = "$\(domainModel.currentPrice)"
        self.marketCap = " $\(domainModel.marketCap)"
        self.totalVolume = "\(domainModel.totalVolume)"
        self.lastUpdated = domainModel.lastUpdated
    }
}

class HomeDomainModelToPresentableMapper {
    static func execute(_ domainModelData:[Cryptocurrency]) -> [CryptoPresentableItem] {
        return domainModelData.map{ CryptoPresentableItem(domainModel: $0)}
    }
}

