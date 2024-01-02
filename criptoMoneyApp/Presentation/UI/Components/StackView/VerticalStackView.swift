//
//  VerticalStackView.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 21/10/2023.
//


import UIKit

class VerticalStackView: UIStackView {
    
    init(subviews: [UIView],
         spacing: CGFloat = 0,
         alignment: UIStackView.Alignment = .leading,
         distribution: UIStackView.Distribution = .fill,
         margins: UIEdgeInsets = .zero,
         backgroundColor: UIColor = .white) {
        
        super.init(frame: .zero)
        subviews.forEach({ self.addArrangedSubview($0) })
        self.axis = .vertical
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = margins
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
