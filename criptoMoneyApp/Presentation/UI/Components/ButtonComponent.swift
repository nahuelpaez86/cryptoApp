//
//  ButtonComponent.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 16/10/2023.
//

import Foundation
import UIKit

enum ButtonComponentType {
    case primary
    case secondary
}

class ButtonComponent : UIButton {
    
    private var type: ButtonComponentType?
    private var name: String?
    private var buttonEvent: (() -> Void)?
    
    init(_ buttonType: ButtonComponentType,_ name:String ) {
        super.init(frame: .zero)
        self.type = buttonType
        self.name = name
        commonConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCallbackAction(_ callback: @escaping (() -> Void)) {
        self.buttonEvent = callback
    }
    
    private func commonConfigure() {
        setTitle(name ?? "" , for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        layer.cornerRadius = 10
        heightAnchor.constraint(equalToConstant: 35).isActive = true
        layer.borderWidth = 1
        layer.borderColor = AppColors.MainBlue?.cgColor
        addTarget(self, action: #selector(eventClick), for: .touchUpInside)
        if type == .primary {
            configurePrimary()
        } else {
            configureSecondary()
        }
    }
    
    @objc func eventClick() {
        if let callback = self.buttonEvent {
            callback()
        }
    }
    
    private func configurePrimary() {
        setTitleColor(AppColors.White, for: .normal)
        backgroundColor = AppColors.MainBlue
    }
    
    private func configureSecondary() {
        setTitleColor(AppColors.MainBlue, for: .normal);
    }
}
