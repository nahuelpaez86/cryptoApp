//
//  handleResult.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 11/11/2023.
//

import Foundation


func handleResult<T>(_ result: Result<T, CriptoCurrencyDomainError> ) -> T? {
     do {
         let response = try result.get()
         return response
     } catch {
         return nil
     }
 }
