//
//  CryptocurrencyListTableViewCell.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import UIKit

class CryptocurrencyListTableViewCell: UITableViewCell {
    lazy var nameLabel = TitleLabel(text: "",style: .bold, type: .subtitle)
    lazy var acronymLabel = TitleLabel(text: "",style: .gray, type: .subtitle)
    lazy var priceLabel = TitleLabel(text: "",style: .blue, type: .subtitle)
    lazy var percentageLabel = TitleLabel(text: "",style:.red, type: .subtitle)
    lazy var icon = IconImage(dimensions: Dimensions(width: 50.0, height: 50.0),cornerRadius: 25)
    
    private lazy var stackNameAndAcronym = VerticalStackView(subviews: [nameLabel,acronymLabel],
                                                             spacing: 1)

    private lazy var stackLeft = HorizontalStackView(subviews: [icon,stackNameAndAcronym],
                                                     spacing: 5,
                                                     alignment: .fill,
                                                     distribution: .equalSpacing)
    
    private lazy var stackRight = VerticalStackView(subviews: [priceLabel,percentageLabel],
                                                    spacing: 1,
                                                    alignment: .leading,
                                                    distribution: .fillEqually)
   
    private lazy var stackMain = HorizontalStackView(subviews: [stackLeft,stackRight],
                                                 spacing: 2,distribution: .equalSpacing,
                                                 margins:.init(top: 0, left: 14, bottom: 0, right: 0))
    var heartButtonAction: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.addSubview(stackMain)
        NSLayoutConstraint.activate([
            stackMain.topAnchor.constraint(equalTo: self.topAnchor,constant: 14),
            stackMain.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -14),
            stackMain.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackMain.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        self.layer.cornerRadius = 10
    }
    
}

extension CryptocurrencyListTableViewCell {
    static var identifier: String { "CryptocurrencyCell" }
    
    // build Cell in TableView.
    static func buildIn(_ tableView: UITableView, indexPath: IndexPath, data: CryptoPresentableItem) -> Self {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? Self
        cell?.nameLabel.text = data.name
        cell?.acronymLabel.text = data.symbol
        UIImage.downloadImage(fromURL: data.image,{ image in cell?.icon.image = image })
        cell?.priceLabel.text = data.currentPrice
        cell?.percentageLabel.text = data.totalVolume
        return cell ?? Self()
    }
}
