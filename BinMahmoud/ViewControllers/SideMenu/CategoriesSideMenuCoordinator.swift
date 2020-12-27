//
//  CategoriesSideMenuCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 21/12/2020.
//

import Foundation
import RxSwift
import SideMenu

class CategoriesSideMenuCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    private let viewModel: CategoriesSideMenuViewModel
    
    init(viewModel: CategoriesSideMenuViewModel) {
        self.viewModel = viewModel
    }
        
    override func start() {
        
        let drawerMenu = SideMenuManager.default.rightMenuNavigationController
        let menuViewController = drawerMenu?.topViewController as? CategoriesSideMenu
        menuViewController?.viewModel = self.viewModel
    }
    
}
