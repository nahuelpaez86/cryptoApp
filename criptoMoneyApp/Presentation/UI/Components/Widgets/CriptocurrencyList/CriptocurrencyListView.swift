//
//  CriptoListView.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 01/11/2023.
//

import Foundation
import UIKit

protocol CriptocurrencyListViewDelegate :AnyObject {
    func touchInDetail(of crypto:CryptoPresentableItem)
}

class CriptocurrencyListView : UIView {
    private var tableView: UITableView = UITableView()
    private var titleLabel = TitleLabel(text: "", style: .bold, type: .title2)
    private var data : [CryptoPresentableItem] = []
    var delegate :CriptocurrencyListViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configTableView()
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(_ data: [CryptoPresentableItem]) {
        self.data = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setTitleLabel(_ label:String) {
        titleLabel.text = label
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // Generic register
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CryptocurrencyListTableViewCell.self, forCellReuseIdentifier: "CryptocurrencyCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setView() {
        self.addSubview(titleLabel)
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 14),
            tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 20),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 14),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -14)
        ])
    }
}

extension CriptocurrencyListView : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CryptocurrencyListTableViewCell.buildIn(tableView, indexPath: indexPath, data: data[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        delegate?.touchInDetail(of: data[index])
    }
}

