//
//  MainScreenNetworkService.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.12.2021.
//

import Foundation

enum MyError: Error {
    case noData
}

protocol MainScreenNetworkServiceProtocol {
    func fetchTopInformationCards(completion: @escaping (Result<[TopInformationCards], MyError>) -> Void)
    func fetchCoefficient(completion: @escaping (Result<[Coefficient], MyError>) -> Void)
    func fetchMoreCoefficient(completion: @escaping (Result<[MoreCoefficient], MyError>) -> Void)
}

final class MainScreenNetworkServiceMock: MainScreenNetworkServiceProtocol {
    func fetchCoefficient(completion: @escaping (Result<[Coefficient], MyError>) -> Void) {
        completion(.success(MainScreenItemsMock.coefficientData))
    }
    
    func fetchMoreCoefficient(completion: @escaping (Result<[MoreCoefficient], MyError>) -> Void) {
        completion(.success(MainScreenItemsMock.moreCoefficientData))
    }
    
    func fetchTopInformationCards(completion: @escaping (Result<[TopInformationCards], MyError>) -> Void) {
        completion(.success(MainScreenItemsMock.topInformationCardsData))
            
    }
}
