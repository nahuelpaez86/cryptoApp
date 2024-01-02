//
//  InputTextFieldPrimary.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 16/10/2023.
//

import Foundation
import UIKit

enum InputType {
    case text
    case password
}

class InputTextFieldPrimary: UIView {
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()

    private let toggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()

    private var placeHolder: String?
    private var inputType: InputType? = .text
    var textChangedCallback: ((String) -> Void)?
  
    
    init(_ inputType: InputType,_ placeholder:String ) {
        super.init(frame: .zero)
        self.inputType = inputType
        self.placeHolder = placeholder
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        configureForInputType()
    }

    private func configureForInputType() {
        if inputType == .text {
            setTextInput()
        } else {
            setPasswordInput()
        }
    }
    
    private func setPasswordInput(){
        setTextField()
        setButton()
        textField.isSecureTextEntry = true
        textField.placeholder = placeHolder
    }
    
    private func setTextInput() {
        setTextField()
        textField.isSecureTextEntry = false
        textField.placeholder = placeHolder
    }
    
    private func setTextField() {
        self.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)])
       
    }
    
    private func setButton() {
        self.addSubview(toggleButton)
        NSLayoutConstraint.activate([
            toggleButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            toggleButton.topAnchor.constraint(equalTo: topAnchor),
            toggleButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            toggleButton.widthAnchor.constraint(equalTo: toggleButton.heightAnchor)
        ])
    }
    
    func getText() -> String? {
        return textField.text
    }
    
    @objc private func togglePasswordVisibility() {
        if inputType == .password {
            textField.isSecureTextEntry = !textField.isSecureTextEntry
            toggleButton.isSelected = !textField.isSecureTextEntry
        }
    }
}
