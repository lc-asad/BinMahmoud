//
//  TabHomeCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 09/12/2020.
//

import UIKit

class TabHomeCoordinator: BaseCoordinator {
    
    private let viewModel: TabHomeViewModel
    
    init(viewModel: TabHomeViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = TabHomeController.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: topRatedDetailCoordinator)
    }
    
}
