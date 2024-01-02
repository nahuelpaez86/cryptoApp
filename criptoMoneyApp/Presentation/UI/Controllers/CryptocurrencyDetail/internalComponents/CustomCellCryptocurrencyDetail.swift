//
//  CustomCellCryptocurrencyDetail.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 02/12/2023.
//

import Foundation
import UIKit

// MARK: - Example
class CustomCellCryptocurrencyDetail : UITableViewCell, ConfigurableCell {
    typealias DataType = CryptoPresentableItem
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setupUI()
     }

     private func setupUI() {
         // Configurar la apariencia de la celda, agregar subvistas, etc.
     }

     // Implementar el método configure del protocolo ConfigurableCell
     func configure(with data: CryptoPresentableItem) {
         // Configurar la celda con los datos proporcionados
         // Actualizar los outlets, textos, imágenes, etc. según los datos
         textLabel?.text = data.currentPrice
         detailTextLabel?.text = data.id
     }
}
