//
//  CriptoCarousel.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 20/10/2023.
//

import Foundation
import UIKit

protocol CriptocurrencyCarouselViewDelegate:AnyObject {
   func viewAllTouch()
}

class CriptocurrencyCarouselView: UIView {
    
    private var collectionView : UICollectionView
    
    private lazy var viewAllButton: UIButton = {
        let btn = UIButton(type: .system, primaryAction: UIAction { _ in self.viewAllAction()})
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.setTitle("Ver todas", for: .normal)
        btn.tintColor = UIColor.gray
        return btn
    }()

    private lazy var titleLabel = TitleLabel(text: "Ultimas favoritas", style: .bold, type: .title2)
    
    private lazy var viewAllHeader = HorizontalStackView(
                                              subviews: [titleLabel,viewAllButton],
                                              spacing: 5,
                                              alignment: .center,
                                              distribution: .equalSpacing,
                                              backgroundColor: AppColors.White3 ?? UIColor.clear)
    
    private lazy var mainStack : UIStackView = VerticalStackView(
                                              subviews:[viewAllHeader,self.collectionView],spacing: 1,alignment: .fill,backgroundColor: AppColors.White3 ?? UIColor.clear)
    var delegate : CriptocurrencyCarouselViewDelegate?
    private var data : [CryptoPresentableItem] = []
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 186, height:156)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        configCollection()
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(_ data : [CryptoPresentableItem] ) {
        self.data = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func configCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CriptocurrencyCollectionViewCell.self, forCellWithReuseIdentifier: CriptocurrencyCollectionViewCell.identifier)
    }
    
    private func setView() {
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 14).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -14).isActive = true
        setCollectionView()
    }
    
    private func setCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.White3
        collectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    private func viewAllAction() {
        self.delegate?.viewAllTouch()
    }
}

extension CriptocurrencyCarouselView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return CriptocurrencyCollectionViewCell.buildIn(collectionView, indexPath: indexPath, data: data[indexPath.item])
    }   
}
