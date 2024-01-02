//
//  CryptocurrencyDetailViewModelDelegate.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

protocol CryptocurrencyDetailViewModelDelegate:AnyObject {
    func successPresentation(_ information: [CryptoPresentableItemDetails])
}
