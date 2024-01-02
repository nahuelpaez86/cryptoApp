//
//  FavoriteCryptocurrenciesViewModelDelegate.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

protocol FavoriteCryptocurrenciesViewModelDelegate:AnyObject {
    func successData()
    func error(_ message:String)
}
