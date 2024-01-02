//
//  FavoriteCryptocurrenciesViewController.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 05/11/2023.
//

import Foundation
import UIKit

class FavoriteCryptocurrenciesViewController : BaseViewController{
    
    lazy var navBar: NavBar = {
        let navBarView = NavBar()
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        navBarView.setTitle("Favoritas", nil)
        navBarView.setLeftbutton(.logout)
        navBarView.delegate = self
        return navBarView
    }()
    
    lazy var CriptoListWidget: CriptocurrencyListView = {
        let widgetList = CriptocurrencyListView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))// set component dimentions with self dimentions.
        widgetList.translatesAutoresizingMaskIntoConstraints = false
        widgetList.delegate = self
        return widgetList
    }()
    
    lazy var EmptyViewComponent:EmptyView = {
        let view = EmptyView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.setData(title: "No Cryptocurrencies fav", description: "You don't have")
       view.isHidden = true
       return view
    }()
    
    private var viewModel :FavoriteCryptocurrenciesViewModel?
    private var cryptoDetailCreate : CryptocurrencyDetailViewControllerFactoryType?
    
    init(viewModel: FavoriteCryptocurrenciesViewModel,cryptoDetailCreate : CryptocurrencyDetailViewControllerFactoryType) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.cryptoDetailCreate = cryptoDetailCreate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.White3
        setView()
        viewModel?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.initData()
        self.showLoading()
    }
    
    private func setView() {
        view.addSubview(navBar)
        view.addSubview(CriptoListWidget)
        view.addSubview(EmptyViewComponent)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44),
            
            CriptoListWidget.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            CriptoListWidget.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            CriptoListWidget.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            CriptoListWidget.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            EmptyViewComponent.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            EmptyViewComponent.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
        ])
    }
    
    private func setListInView(_ data: [CryptoPresentableItem]) {
        let isEmpty = data.isEmpty
        hiddenView(EmptyViewComponent, !isEmpty)
        hiddenView(CriptoListWidget, isEmpty)
        if !isEmpty {CriptoListWidget.updateData(data)}
    }
    
    private func hiddenView(_ uiView:UIView , _ hidden:Bool) {
        DispatchQueue.main.async {
            uiView.isHidden = hidden
        }
    }
}

extension FavoriteCryptocurrenciesViewController : CriptocurrencyListViewDelegate {
    func touchInDetail(of crypto: CryptoPresentableItem) {
        if let vc = cryptoDetailCreate?.build(crypto) {
            vc.modalPresentationStyle = .fullScreen
            present(vc , animated: true)
        }
    }
}

extension FavoriteCryptocurrenciesViewController: FavoriteCryptocurrenciesViewModelDelegate {
    func successData() {
        self.hideLoading()
        if let allFav = viewModel?.allFavouriteCryptocurrencies{
           setListInView(allFav)
        }
    }
    
    func error(_ message: String) {
        print(message)
    }
}

extension FavoriteCryptocurrenciesViewController : NavbarDelegate {
    func buttonLeftAction() { popViewController() }
}
