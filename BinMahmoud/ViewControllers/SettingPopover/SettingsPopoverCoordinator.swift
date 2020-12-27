//
//  SettingsPopoverCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 13/12/2020.
//

import UIKit

class SettingsPopoverCoordinator: BaseCoordinator {
    
    private let viewModel: SettingsPopoverViewModel
    
    init(viewModel: SettingsPopoverViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = SettingsPopoverVC.instantiate()
        viewController.viewModel = viewModel
        //navigationController.viewControllers = [viewController]
       
    }
    
    
}

