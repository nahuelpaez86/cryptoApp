//
//  EmptyView.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 08/12/2023.
//

import UIKit

class EmptyView :UIView {
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()

        // Initializer
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            ])
        }

        // Public method to set data
        func setData(title: String, description: String) {
            titleLabel.text = title
            descriptionLabel.text = description
        }
}
