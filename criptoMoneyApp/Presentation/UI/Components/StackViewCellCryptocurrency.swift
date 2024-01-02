//
//  StackViewCellCryptocurrency.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 03/12/2023.
//
import UIKit

class StackViewCellCryptocurrency : UIView {
    private var titleLabel: TitleLabel
    private var descriptionLabel: TitleLabel
    private var verticalStack: VerticalStackView

    init(frame: CGRect,_ title:String ,_ description:String) {
        titleLabel = TitleLabel(text: title, style: .gray, type: .subtitle)
        descriptionLabel = TitleLabel(text: description, style: .bold, type: .title1)
        verticalStack = VerticalStackView(subviews: [titleLabel, descriptionLabel],spacing: 5)

        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ title:String ,_ description: String ) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }

    private func setView() {
        self.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 74),
            verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            verticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
        self.setAppearance()
    }
    
    private func setAppearance() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
    }
}
