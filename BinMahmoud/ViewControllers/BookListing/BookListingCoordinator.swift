//
//  BookListingCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 09/12/2020.
//

import UIKit

class BookListingCoordinator: BaseCoordinator {
   
    private let viewModel: BookListingViewModel
    
    init(viewModel: BookListingViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = BookListingVC.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.viewControllers = [viewController]
    }
    

    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: topRatedDetailCoordinator)
    }
    
}
