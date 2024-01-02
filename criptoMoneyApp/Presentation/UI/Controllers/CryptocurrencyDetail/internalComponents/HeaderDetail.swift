//
//  HeaderDetail.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 20/11/2023.
//

import UIKit
import Foundation

protocol HeaderCryptoDetailDelegate: AnyObject {
    func favButtonCallback(_ status:Bool)
}

class HeaderCryptoDetail : UIView {
    private var titleLabel: TitleLabel
    private var descriptionLabel: TitleLabel
    private var verticalStack: VerticalStackView
    private var buttonFav: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.addTarget(self, action: #selector(tapInFavButton), for: .touchDown)
        return button
    }()
    lazy var imageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return image
    }()
    private var favourite = false
    var delegate :HeaderCryptoDetailDelegate?
        
    override init(frame: CGRect) {
        titleLabel = TitleLabel(text: "", style: .gray, type: .title2)
        descriptionLabel = TitleLabel(text: "", style: .bold, type: .title1)
        verticalStack = VerticalStackView(subviews: [titleLabel, descriptionLabel],spacing: 5)
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ title :String , _ description: String,_ image:String,_ isFav:Bool) {
        setImage(image)
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.favourite = isFav
        setFavButton(isFav)
    }
    
    @objc
    func tapInFavButton() {
        favourite = !favourite
        setFavButton(favourite)
        delegate?.favButtonCallback(favourite)
    }
    
    private func setFavButton(_ isFavourite:Bool) {
        let image = isFavourite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        buttonFav.setImage(image, for: .normal)
    }
    
    private func setImage(_ url :String ) {
        UIImage.downloadImage(fromURL: url) { self.imageView.image = $0 }
    }
    
    private func setView() {
        self.addSubview(verticalStack)
        self.addSubview(imageView)
        self.addSubview(buttonFav)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 90),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            verticalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor,constant: 20),
            buttonFav.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonFav.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        self.setAppearance()
    }
    
    private func setAppearance() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
    }
}
