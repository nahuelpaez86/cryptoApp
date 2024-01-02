//
//  LoginViewController.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 16/10/2023.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    lazy var userNameField: InputTextFieldPrimary = {
       let textField = InputTextFieldPrimary(.text, "Nombre")
       textField.translatesAutoresizingMaskIntoConstraints = false
       return textField
    }()
    
    lazy var buttonAction: ButtonComponent = {
        let button = ButtonComponent(.primary, "Ingresar")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCallbackAction { self.callbackButton() }
        return button
    }()
    
    lazy var stackField : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        view.backgroundColor = AppColors.MainGray
    }
    
    private func setView() {
        setStackView()
        setFieldsInStack()
    }
    
    private func setStackView() {
        view.addSubview(stackField)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackField.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 20),
            stackField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -20),
            stackField.centerYAnchor.constraint(equalTo:  safeArea.centerYAnchor)
        ])
    }
    
    private func setFieldsInStack() {
        stackField.addArrangedSubview(userNameField)
        stackField.addArrangedSubview(buttonAction)
    }
    
    func callbackButton() {
        if let name = userNameField.getText(), !name.isEmpty {
            viewModel.setUserName(name)
            navigate()
        }
    }
    
    private func navigate() {
        let tab = TabBarControllerBuild.setupCustomTabBarController()
        navigationController?.pushViewController(tab, animated: true)
    }
}
