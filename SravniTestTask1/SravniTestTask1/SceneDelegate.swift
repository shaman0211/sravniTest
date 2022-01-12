//
//  SceneDelegate.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let viewController = MainScreenAssembly.assemble()
        //let router = TopInformationCardsRouter.start()
        //let initialViewController = router.entry
        
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
        
        
        
    }

}

