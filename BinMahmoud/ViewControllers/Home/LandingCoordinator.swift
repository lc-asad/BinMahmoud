//
//  StartCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit
import RxSwift

class LandingCoordinator: BaseCoordinator {
   
    private let disposeBag = DisposeBag()
    private let viewModel: LandingViewModel
    
    init(viewModel: LandingViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
        viewModel.didSelectIndex
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] index in self?.navigateToTabBarController() })
            .disposed(by: disposeBag)
        
        
        let viewController = LandingViewController.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [viewController]
    }
    
    func navigateToTabBarController() {
        
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(TabBarCoordinator.self)!
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
    
}
