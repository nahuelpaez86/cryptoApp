//
//  Header.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 19/10/2023.
//
import UIKit

class Header : UIView {
    
    lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bienvenido!"
        label.font = UIFont(name: "Helvetica-Bold", size: 22.0)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var subTitleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hola ! Nahuel"
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var stack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setName(_ name: String) {
        let text = "Hola! \(name)"
        subTitleLabel.text = text
    }
    
    private func configUI() {
       self.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.heightAnchor.constraint(equalToConstant: 90)
        ])
        setStack()
    }
    
    private func setStack() {
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subTitleLabel)
    }
    
}
