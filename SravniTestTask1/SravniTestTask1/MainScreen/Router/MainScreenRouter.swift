//
//  MainScreenRouter.swift
//  SravniTestTask1
//
//  Created by Artem  on 17.12.2021.
//

import UIKit

protocol MainScreenRouterInput {
    func openMainScreen()
}

final class MainScreenRouter: MainScreenRouterInput {
    weak var rootViewController: UIViewController?
    
    func openMainScreen() {
        let viewController = UIViewController(nibName: nil, bundle: nil)
        viewController.view.backgroundColor = .red
        
        rootViewController?.present(viewController, animated: true, completion: nil)
    }
}
