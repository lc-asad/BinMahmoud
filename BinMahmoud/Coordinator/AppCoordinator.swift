//
//  AppCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window = UIWindow(frame: UIScreen.main.bounds)
    private let networkService: Networking
    
    init(networkConfig: Networking) {
        self.networkService = networkConfig
    }
    
    
   override func start() {
        window.makeKeyAndVisible()
        
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(LandingCoordinator.self)!
        start(coordinator: coordinator)
    
        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }

}
