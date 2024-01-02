//
//  HomeViewModelDelegate.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 10/12/2023.
//

import Foundation

protocol HomeViewModelDelegate:AnyObject {
    func successData()
    func error(message:String)
}
