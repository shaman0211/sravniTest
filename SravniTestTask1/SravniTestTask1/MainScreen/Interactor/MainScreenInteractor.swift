//
//  MainScreenInteractor.swift
//  SravniTestTask1
//
//  Created by Artem  on 17.12.2021.
//

import Foundation

protocol MainScreenInteractorInput {
    func getData()
}

protocol MainScreenInteractorOutput: AnyObject {
    func provideCoefficientData(data: [Coefficient])
    func provideMoreCoefficientData(data: [MoreCoefficient])
    func provideTopInformationCardsData(data: [TopInformationCards])
    
    func someError(errorName: String)
}
    
final class MainScreenInteractor: MainScreenInteractorInput {
    weak var presenter: MainScreenInteractorOutput?
    
    let networkService: MainScreenNetworkServiceProtocol
    
    init(networkService: MainScreenNetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getData() {
        networkService.fetchCoefficient { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.provideCoefficientData(data: data)
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.someError(errorName: error.localizedDescription)
                }
                
            }
        }
        
        networkService.fetchMoreCoefficient { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.provideMoreCoefficientData(data: data)
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.someError(errorName: error.localizedDescription)
                }
                
            }
        }
        
        networkService.fetchTopInformationCards { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.provideTopInformationCardsData(data: data)
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.someError(errorName: error.localizedDescription)
                }
                
            }
        }
       
    }
}
