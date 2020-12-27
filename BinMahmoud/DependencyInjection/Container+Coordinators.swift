//
//  Container+Coordinators.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 11/12/2020.
//

import Swinject

extension Container {
    func registerCoordinators() {
        
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(LandingCoordinator.self, initializer: LandingCoordinator.init)
        autoregister(TabBarCoordinator.self, initializer: TabBarCoordinator.init)
        autoregister(VedioListingCoordinator.self, initializer: VedioListingCoordinator.init)
        autoregister(AudioListingCoordinator.self, initializer: AudioListingCoordinator.init)
        autoregister(BookListingCoordinator.self, initializer: BookListingCoordinator.init)
        autoregister(TabHomeCoordinator.self, initializer: TabHomeCoordinator.init)
        autoregister(YouTubePlayerCoordinate.self, initializer: YouTubePlayerCoordinate.init)
        autoregister(CategoriesSideMenuCoordinator.self, initializer: CategoriesSideMenuCoordinator.init)
        
    }
}
