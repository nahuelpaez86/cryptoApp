//
//  HomeViewController.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    lazy var navBar: NavBar = {
        let navBarView = NavBar()
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        navBarView.setTitle("Inicio",nil)
        navBarView.setLeftbutton(.logout)
        navBarView.delegate = self
        return navBarView
    }()
    
    lazy var welcomeView: Header = {
       let view = Header()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.setName("Matias")
       return view
    }()
    
    lazy var CriptoWidget: CriptocurrencyCarouselView = {
        let widget = CriptocurrencyCarouselView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 90))// set component dimentions with self dimentions.
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.delegate = self
        return widget
    }()
    
    lazy var CriptoListWidget: CriptocurrencyListView = {
        let widgetList = CriptocurrencyListView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))// set component dimentions with self dimentions.
        widgetList.translatesAutoresizingMaskIntoConstraints = false
        widgetList.setTitleLabel("Todas")
        widgetList.delegate = self
        return widgetList
    }()
    
    lazy var stack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()

    private var viewModel :HomeViewModel?
    private var cryptoDetailCreate : CryptocurrencyDetailViewControllerFactoryType?
    
    init(viewModel: HomeViewModel,cryptoDetailCreate : CryptocurrencyDetailViewControllerFactoryType) {
         super.init(nibName: nil, bundle: nil)
         self.viewModel = viewModel
         self.cryptoDetailCreate = cryptoDetailCreate
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.White3
        setView()
        viewModel?.delegate = self
        viewModel?.initData()
        setName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getFirstFourFavCryptocurrencies()
    }
    
    private func setView() {
        view.addSubview(navBar)
        view.addSubview(stack)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44),
            
            stack.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        setStack()
        setLoading()
    }
    
    private func setStack() {
        stack.addArrangedSubview(welcomeView)
        stack.addArrangedSubview(CriptoWidget)
        stack.addArrangedSubview(CriptoListWidget)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutIfNeeded()
    }
    
    private func setFavWidget(_ data: [CryptoPresentableItem] ) {
        DispatchQueue.main.async {
            self.CriptoWidget.isHidden = data.isEmpty
            self.CriptoWidget.updateData(data)
        }
        dissmissLoading()
    }
    
    private func setListOfAll(_ data:[CryptoPresentableItem]) {
        self.CriptoListWidget.updateData(data)
    }
    
    private func setLoading() {
        self.stack.isHidden = true
        showLoading()
    }
    
    private func dissmissLoading() {
        DispatchQueue.main.async {
            self.hideLoading()
            self.stack.isHidden = false
        }
    }
    
    private func setName() {
        let name = viewModel?.getName() ?? ""
        self.welcomeView.setName(name)
    }
    
    private func presentErrorView() {
        DispatchQueue.main.async {
            let controller = ErrorViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func successData() {
        if let allCryptocurrencies = viewModel?.cryptocurriencys,
           let favCryptocurrencies = viewModel?.favCryptocurriencys {
            setFavWidget(favCryptocurrencies)
            setListOfAll(allCryptocurrencies)
        }
        dissmissLoading()
    }
    
    func error(message: String) {
        dissmissLoading()
        presentErrorView()
    }
}

extension HomeViewController: NavbarDelegate {
    func buttonLeftAction() { popViewController() }
}

extension HomeViewController : CriptocurrencyListViewDelegate {
    func touchInDetail(of crypto: CryptoPresentableItem) {
        if let vc = cryptoDetailCreate?.build(crypto) {
            vc.modalPresentationStyle = .fullScreen
            present(vc , animated: true)
        }
    }
}

extension HomeViewController : CriptocurrencyCarouselViewDelegate{
    func viewAllTouch() {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 1
        }
    }
}
