//
//  CryptocurrencyDetailViewModel.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 07/12/2023.
//

import Foundation

class CryptocurrencyDetailViewModel {
    private var cryptocurrencyDetailUseCase :CryptocurrencyDetailUseCaseType
    private var cryptocurrencyInformationPresentation:[CryptoPresentableItemDetails]?
    private var cryptocurrencyInformation: CryptoPresentableItem
    
    var delegate:CryptocurrencyDetailViewModelDelegate?
    
    init(cryptocurrencyInformation: CryptoPresentableItem,cryptocurrencyDetailUseCase:CryptocurrencyDetailUseCaseType) {
        self.cryptocurrencyInformation = cryptocurrencyInformation
        self.cryptocurrencyDetailUseCase = cryptocurrencyDetailUseCase
    }
   
    func setInformation() {
        prepareInformationToPresent(cryptocurrencyInformation)
    }
    
    func setFav(_ status:Bool) {
        let currentId = cryptocurrencyInformation.id
       status ? cryptocurrencyDetailUseCase.setNewFavoriteCryptocurrency(currentId) : cryptocurrencyDetailUseCase.removeFavoriteCryptocurrency(currentId)
    }

    func getCharts() { }
    
    private func prepareInformationToPresent(_ domainInformation :CryptoPresentableItem ) {
        let isFav = String(cryptocurrencyDetailUseCase.getFavoriteStatus(domainInformation.id))
        cryptocurrencyInformationPresentation = CryptoDetailDomainModelToPresentableMapper.execute(domainInformation,isFav)
        delegate?.successPresentation(cryptocurrencyInformationPresentation ?? [])
    }
}
