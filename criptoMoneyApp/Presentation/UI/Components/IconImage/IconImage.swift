//
//  IconImage.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation
import UIKit

struct Dimensions {
    let width: CGFloat
    let height: CGFloat

    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
}

class IconImage : UIImageView {
    init(image: UIImage = UIImage(),dimensions:Dimensions?, cornerRadius:CGFloat = 0.0 , backgroundColor:UIColor = .clear ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        setDimensions(dimensions)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setDimensions(_ dimensions: Dimensions?) {
        if let height = dimensions?.height,
           let width = dimensions?.width {
           self.heightAnchor.constraint(equalToConstant: height).isActive = true
           self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}

