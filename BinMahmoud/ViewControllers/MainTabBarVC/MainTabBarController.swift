//
//  MainTabBarController.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit

class MainTabBarController: UITabBarController,Storyboarded {
    
    //MARK: variables
    var viewModel: MainTabBarViewModel?
    

    //MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else { return }
        viewModel.setTabBar(tabBar: self.tabBar)
        
    }

}
