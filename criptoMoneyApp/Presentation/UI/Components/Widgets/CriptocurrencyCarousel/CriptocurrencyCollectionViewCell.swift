//
//  CriptoCarosuelCollectionViewCell.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 20/10/2023.
//

import Foundation
import UIKit

class CriptocurrencyCollectionViewCell: UICollectionViewCell {

    lazy var nameLabel = TitleLabel(text: "Bitcoin",style: .bold, type: .subtitle)
    lazy var acronymLabel = TitleLabel(text: "Bitcoin",style: .gray, type: .subtitle)
    lazy var priceLabel = TitleLabel(text: "$2023.3023",style: .blue, type: .subtitle)
    lazy var percentageLabel = TitleLabel(text: "-20%",style:.red, type: .subtitle)
    lazy var icon = IconImage(dimensions: Dimensions(width: 50.0, height: 50.0),cornerRadius: 25)
    
    private lazy var stackNameAndAcronym = VerticalStackView(subviews: [nameLabel,acronymLabel],spacing: 1)
    
    private lazy var stackTop = HorizontalStackView(subviews: [icon,stackNameAndAcronym],spacing: 5,
                                                    alignment: .fill,distribution: .equalSpacing)
    
    private lazy var stackBotttom = VerticalStackView(subviews: [priceLabel,percentageLabel],spacing: 1,alignment: .leading,distribution: .fillEqually)

    private lazy var stack = VerticalStackView(subviews: [stackTop,stackBotttom],spacing: 5,distribution: .equalSpacing, margins:.init(top: 0, left: 14, bottom: 0, right: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.White
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor,constant: 14),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -14),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        self.layer.cornerRadius = 10
    }
    
   
}
extension CriptocurrencyCollectionViewCell {
    static var identifier: String { "CriptoCollectionViewCell" }
    
    // build Cell in collectionView
    static func buildIn(_ collection: UICollectionView, indexPath: IndexPath, data: CryptoPresentableItem) -> Self {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as? Self
        cell?.nameLabel.text = data.name
        cell?.acronymLabel.text = data.symbol
        UIImage.downloadImage(fromURL: data.image,{ image in cell?.icon.image = image })
        cell?.priceLabel.text = data.currentPrice
        cell?.percentageLabel.text = data.totalVolume
        return cell ?? Self()
    }
}
