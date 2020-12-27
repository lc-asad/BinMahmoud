//
//  MainTabBarViewModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit

struct MainTabBarViewModel {
    
    func setTabBar(tabBar : UITabBar) {
        
        tabBar.layer.shadowColor = UIColor(hex: "#e8d3b1")?.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tabBar.layer.shadowRadius = 1
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.masksToBounds = false
          
    }
}


