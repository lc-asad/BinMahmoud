//
//  Container+ViewModels.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 11/12/2020.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(LandingViewModel.self, initializer: LandingViewModel.init)
        autoregister(MainTabBarViewModel.self, initializer: MainTabBarViewModel.init)
        autoregister(VideoListingViewModel.self, initializer: VideoListingViewModel.init)
        autoregister(AudioListingViewModel.self, initializer: AudioListingViewModel.init)
        autoregister(BookListingViewModel.self, initializer: BookListingViewModel.init)
        autoregister(TabHomeViewModel.self, initializer: TabHomeViewModel.init)
        autoregister(YouTubePlayerViewModel.self, initializer: YouTubePlayerViewModel.init)
        autoregister(CategoriesSideMenuViewModel.self, initializer: CategoriesSideMenuViewModel.init)
        
    }
}
