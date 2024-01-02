//
//  LoginViewModel.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation


class LoginViewModel {
    
    func setUserName(_ name:String) {
        UserDefaults.standard.setValue(name, forKey: "userName")
    }
}
