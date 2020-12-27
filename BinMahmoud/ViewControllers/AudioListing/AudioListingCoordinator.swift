//
//  AudioListingCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 09/12/2020.
//

import UIKit

class AudioListingCoordinator: BaseCoordinator {
    
    private let viewModel: AudioListingViewModel
    
    init(viewModel: AudioListingViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = AudioListingVC.instantiate()
        viewController.viewModel = viewModel
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: topRatedDetailCoordinator)
    }
    
}
