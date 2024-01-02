//
//  Cryptocurrency.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 04/11/2023.
//

import Foundation


struct Cryptocurrency:Equatable {
        let id :String
        let symbol:String
        let name:String
        let image:String
        let currentPrice:String
        let marketCap:String
        let totalVolume:String
        let lastUpdated:String
    
      // this protocol will be for compare two instances of this entity
     // compares the ids for the fav filter
       static func ==(lhs: Cryptocurrency, rhs: Cryptocurrency) -> Bool {
           return lhs.id == rhs.id
       }
}
