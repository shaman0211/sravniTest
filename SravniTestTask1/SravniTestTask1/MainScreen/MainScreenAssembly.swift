//
//  MainScreenAssembly.swift
//  SravniTestTask1
//
//  Created by Artem  on 17.12.2021.
//

import Foundation
import UIKit

final class MainScreenAssembly {
    
    static func assemble() -> UIViewController {
        let view = MainScreenView()
        let interactor = MainScreenInteractor(networkService: MainScreenNetworkServiceMock())
        let router = MainScreenRouter()
        let presenter = MainScreenPresenter(router: router)
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.rootViewController = view
        return view
    }
}
