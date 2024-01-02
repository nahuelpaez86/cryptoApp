//
//  ErrorViewController.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 30/12/2023.
//
import UIKit

class ErrorViewController: BaseViewController {
    lazy var imageView : UIImageView = {
      let image = UIImageView()
      image.translatesAutoresizingMaskIntoConstraints = false
      return image
    }()
    
    lazy var titleLabel : TitleLabel = TitleLabel(text: "Ha ocurrido un error",
                                                  style: .red,
                                                  type: .title1)
    lazy var descriptionLabel : TitleLabel = TitleLabel(text: "Intente mas tarde.",
                                                        style: .bold,
                                                        type: .subtitle)
    
    lazy var buttonAction: ButtonComponent = {
        let button = ButtonComponent(.primary, "Reintentar")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.setCallbackAction { self.callbackButton() }
        return button
    }()
    
    lazy var stack : UIStackView = {
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.spacing = 5
        vStack.alignment = .center
        vStack.axis = .vertical
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        view.backgroundColor = .white
    }
    
    private func setView() {
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        setImageView()
        setStack()
    }
    
    private func setImageView() {
        imageView.image = UIImage(systemName: "gear")?.withRenderingMode(.alwaysOriginal)
        imageView.image?.withTintColor(UIColor(red: 0, green: 1, blue: 2, alpha: 2))
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    private func setStack() {
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(buttonAction)
    }
    
    private func callbackButton() {
        self.dismiss(animated: true)
    }
}
