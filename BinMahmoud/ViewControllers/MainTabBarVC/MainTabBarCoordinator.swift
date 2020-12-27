//
//  MainTabBarCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit



class TabBarCoordinator: BaseCoordinator {
    private let viewModel: MainTabBarViewModel
    
    init(viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        
        let tabBarController = MainTabBarController.instantiate()
        tabBarController.viewModel = viewModel
        
//        navigationController.viewControllers = [tabBarController]
        
        //audioListingCoordinator
        let audioNavigationController = UINavigationController()
        let audioListingCoordinator = AppDelegate.container.resolve(AudioListingCoordinator.self)!
        audioListingCoordinator.navigationController = audioNavigationController
        audioNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"tab_audio_icon"), selectedImage: UIImage(named:"tab_audio_icon"))
        
        
        //vedioListingCoordinator
        let vedioNavigationController = UINavigationController()
        let vedioListingCoordinator = AppDelegate.container.resolve(VedioListingCoordinator.self)!
        vedioListingCoordinator.navigationController = vedioNavigationController
        vedioNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"tab_video_icon"), selectedImage: UIImage(named:"tab_video_icon"))
        
        
        //moreListingCoordinator
        let moreNavigationController = UINavigationController()
        let moreListingCoordinator = AppDelegate.container.resolve(VedioListingCoordinator.self)!
        moreListingCoordinator.navigationController = moreNavigationController
        moreNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"rectangle"), selectedImage: UIImage(named:"rectangle"))
        
        
        //bookListingCoordinator
        let bookNavigationController = UINavigationController()
        let bookListingCoordinator = AppDelegate.container.resolve(BookListingCoordinator.self)!
        bookListingCoordinator.navigationController = bookNavigationController
        bookNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"tab_book_icon"), selectedImage: UIImage(named:"tab_book_icon"))
        
        
        // Home coordinator
        let homeNavigationController = UINavigationController()
        let tabHomeCoordinator = AppDelegate.container.resolve(TabHomeCoordinator.self)!
        tabHomeCoordinator.navigationController = homeNavigationController
        homeNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"tab_home_icon"), selectedImage: UIImage(named:"tab_home_icon"))
        
        
        tabBarController.viewControllers = [audioNavigationController,
                                            vedioNavigationController,
                                            moreNavigationController,
                                            bookNavigationController,
                                            homeNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        //navigationController.present(tabBarController, animated: true, completion: nil)
        navigationController.viewControllers = [tabBarController]
        
        // Side menu
        let coordinator = AppDelegate.container.resolve(CategoriesSideMenuCoordinator.self)!
        coordinator.navigationController = UINavigationController()
        start(coordinator: coordinator)
        
        start(coordinator: audioListingCoordinator)
        start(coordinator: vedioListingCoordinator)
        start(coordinator: moreListingCoordinator)
        start(coordinator: bookListingCoordinator)
        start(coordinator: tabHomeCoordinator)
        
    }
    

}
