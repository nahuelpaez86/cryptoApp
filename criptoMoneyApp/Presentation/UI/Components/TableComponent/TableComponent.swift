//
//  TableComponent.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 02/12/2023.
//
import UIKit

/**
        This component is generic tableView.
        The component needs:
         - T data
         - Cell: UITableViewCell and ConfigurableCell: Custom UITableViewCell needs to inherit from ConfigurableCell.
               
 **/

class MyTableViewComponent<T, Cell: UITableViewCell & ConfigurableCell>: UIView, UITableViewDelegate, UITableViewDataSource {
    private var data: [T] = []
    private var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTableView()
    }

    private func setupTableView() {
        tableView = UITableView(frame: bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "cellIdentifier")
        addSubview(tableView)
    }

    func setData(_ data: [T]) {
        self.data = data
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! Cell
        cell.configure(with: data[indexPath.row] as! Cell.DataType)
        return cell
    }

    // Agrega otros métodos UITableViewDelegate según sea necesario
}

// Protocolo para celdas configurables
protocol ConfigurableCell {
    associatedtype DataType
    func configure(with data: DataType)
}
