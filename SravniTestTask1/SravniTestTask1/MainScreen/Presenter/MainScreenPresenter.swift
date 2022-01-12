//
//  MainScreenPresenter.swift
//  SravniTestTask1
//
//  Created by Artem  on 17.12.2021.
//

import Foundation

protocol MainScreenPresenterInput {
    var dataSource: [MainScreenSection] { get }
    
    func loadData()
}

protocol MainScreenPresenterOutput: AnyObject {
    func dataChanged()
}

final class MainScreenPresenter: MainScreenPresenterInput {
    weak var output: MainScreenPresenterOutput?
    
    var interactor: MainScreenInteractorInput?
    private let router: MainScreenRouterInput
    weak var view: MainScreenPresenterOutput?
    
    private(set) var dataSource: [MainScreenSection] = []
    
    private var state: PresentationData = .init(moreCoefficientData: [], topInformationCardsData: [], coefficientData: [])
    
    init(router: MainScreenRouterInput) {
            self.router = router
    }
    
    func loadData() {
        interactor?.getData()
    }
}



extension MainScreenPresenter: MainScreenInteractorOutput {
    func someError(errorName: String) {
        print("Some error")
    }

    func provideTopInformationCardsData(data: [TopInformationCards]) {
        state.topInformationCardsData = data
        updatePresenterOutput(state: state)
    }
    
    func provideCoefficientData(data: [Coefficient]) {
        state.coefficientData = data
        updatePresenterOutput(state: state)
    }
    
    func provideMoreCoefficientData(data: [MoreCoefficient]) {
        state.moreCoefficientData = data
        updatePresenterOutput(state: state)
    }
    
    private func updatePresenterOutput(state: PresentationData) {
        dataSource = generateDataSource(data: state)
        view?.dataChanged()
    }
    
    private func getMoreCoefficientData(data: [MoreCoefficient]) -> [MainScreenItem] {
        data.map { .moreCoefficientItem(data: $0) }
    }

    private func getTopInformationCardsData(data: [TopInformationCards]) -> [MainScreenItem] {
        return [.topInformationItem(data: data)]
    }

    private func getCoefficientData(data: [Coefficient]) -> [MainScreenItem] {
        return [.OSAGOItem(data: data)]
    }
    
    private func generateDataSource(data: PresentationData) -> [MainScreenSection] {
        return [.init(title: "Как рассчитывается цена на полис ОСАГО", titleSize: 28, insets: 24, bgColor: SColors.main06, items: getTopInformationCardsData(data: data.topInformationCardsData)),
                .init(title: "Как формируется цена?", titleSize: 20, insets: 12, bgColor: .white, items: getCoefficientData(data: data.coefficientData)),
                .init(title: "Подробнее о коэффициентах", titleSize: 20, insets: 16, bgColor: .white, items: getMoreCoefficientData(data: data.moreCoefficientData))]
    }
    
    
}
