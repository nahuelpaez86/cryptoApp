//
//  TitleLabel.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 21/10/2023.
//

import UIKit

enum TextStyle {
    case bold
    case gray
    case blue
    case red
    case green
    
    var color: UIColor {
        switch self {
        case .bold:
            return AppColors.Black
        case .gray:
            return AppColors.MainGray ?? .gray
        case .blue:
            return AppColors.MainBlue ?? .blue
        case .red:
            return UIColor.red
        case .green:
            return UIColor.green
        }
    }
    
}

enum FontType {
    case title1
    case title2
    case subtitle
    
    var font: UIFont {
        switch self {
        case .title1:
            return UIFont(name: "Helvetica-Bold", size: 22.0) ?? UIFont.systemFont(ofSize: 22.0)
        case .title2:
            return UIFont.systemFont(ofSize: 20.0)
        case .subtitle:
            return UIFont.systemFont(ofSize: 16.0)
        }
    }
    
}


class TitleLabel: UILabel {
    
    init(text: String = "", style: TextStyle = .gray , type: FontType = .title1) {
        super.init(frame: .zero)
        self.text = text
        self.numberOfLines = 0
        self.textColor = style.color
        self.font = type.font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
