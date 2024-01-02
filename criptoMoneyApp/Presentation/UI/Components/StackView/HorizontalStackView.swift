//
//  HorizontalStackView.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 21/10/2023.
//

import UIKit

class HorizontalStackView: UIStackView {
    
    init(subviews: [UIView],
         spacing: CGFloat = 0,
         alignment: UIStackView.Alignment = .top,
         distribution: UIStackView.Distribution = .fill,
         margins: UIEdgeInsets = .zero,
         backgroundColor: UIColor = .white,
         cornerRadius: CGFloat = 0) {
        
        super.init(frame: .zero)
        subviews.forEach({ self.addArrangedSubview($0) })
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = margins
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

