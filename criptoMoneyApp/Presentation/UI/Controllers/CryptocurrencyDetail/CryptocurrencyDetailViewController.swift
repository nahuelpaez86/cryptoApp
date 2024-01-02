//
//  CryptocurrencyDetailViewController.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 12/11/2023.
//

import Foundation
import UIKit

class CryptocurrencyDetailViewController :BaseViewController {
    lazy var navBar: NavBar = {
        let navBarView = NavBar()
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        navBarView.setLeftbutton(.back)
        navBarView.delegate = self
        return navBarView
    }()
    
    lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var headerDetail :HeaderCryptoDetail = {
        let header = HeaderCryptoDetail()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        return header
    }()
    
    private var viewModel : CryptocurrencyDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.White
        configView()
        viewModel?.setInformation()
    }
    
    init(viewModel:CryptocurrencyDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        view.addSubview(navBar)
        view.addSubview(stackView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44),
            stackView.topAnchor.constraint(equalTo: navBar.topAnchor,constant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 15),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -15)
        ])
       
        view.backgroundColor = AppColors.White3
    }
    
    private func setHeader(_ name:String,_ price:String ,_ image:String,_ isFav:String) {
        let fav = isFav.lowercased() == "true"
        headerDetail.setData(name,price,image,fav)
    }
    
    private func setCryptoInformation(_ information : [CryptoPresentableItemDetails]) {
        stackView.addArrangedSubview(headerDetail)
        information.forEach {  stackView.addArrangedSubview(StackViewCellCryptocurrency(frame: view.bounds, $0.title, $0.description))}
    }
    
    private func setNavbar(_ name:String , _ image:String) {
        UIImage.downloadImage(fromURL: image,{ imageLog in
           self.navBar.setTitle(name, imageLog)
        })
    }
}

extension CryptocurrencyDetailViewController:CryptocurrencyDetailViewModelDelegate {
    func successPresentation(_ information: [CryptoPresentableItemDetails]) {
        setNavbar(information[2].description, information[3].description)
        setCryptoInformation([information[4],information[5],information[6]])
        setHeader(information[2].description, information[5].description, information[3].description,information[7].description)
    }
}

extension CryptocurrencyDetailViewController :NavbarDelegate {
    func buttonLeftAction() {
        self.dismiss(animated: true)
    }
}

extension CryptocurrencyDetailViewController :HeaderCryptoDetailDelegate {
    func favButtonCallback(_ status: Bool) {
        viewModel?.setFav(status)
    }
}
