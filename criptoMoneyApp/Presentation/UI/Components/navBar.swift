//
//  navBar.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation
import UIKit

enum typeOfIcon {
    case logout
    case back
}
protocol NavbarDelegate : AnyObject {
    func buttonLeftAction()
}

class NavBar : UIView {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Titulo"
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        return label
    }()
    
    lazy var imageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 25).isActive = true
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return image
    }()
    
    lazy var buttonLeft :UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonLeftAction), for: .touchUpInside)
        return button
    }()
    
    lazy var borderBottomView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2
        return view
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 2
        stack.axis = .horizontal
        return stack
    }()
    
    weak var delegate: NavbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String ,_ image: UIImage?) {
        if let image = image {
            imageView.image = image
            stack.addArrangedSubview(imageView)
        }
        self.titleLabel.text = title
        stack.addArrangedSubview(titleLabel)
    }
    
    func setLeftbutton(_ type: typeOfIcon) {
        let icon = getIcon(type: type)
        buttonLeft.setImage(UIImage(systemName:icon, withConfiguration: .none), for: .normal)
    }
    
    private func getIcon(type:typeOfIcon) -> String {
        switch type {
        case .logout : return "rectangle.portrait.and.arrow.forward"
        case .back:  return "chevron.backward"
        }
    }
    
    @objc func buttonLeftAction() {
        delegate?.buttonLeftAction()
    }
    
    private func config() {
        self.addSubview(stack)
        self.addSubview(buttonLeft)
        self.addSubview(borderBottomView)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            borderBottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            borderBottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderBottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
