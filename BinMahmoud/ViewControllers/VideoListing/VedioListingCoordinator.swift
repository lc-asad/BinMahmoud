//
//  VedioListingCoordinator.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 09/12/2020.
//

import UIKit
import RxSwift

class VedioListingCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    private let viewModel: VideoListingViewModel
    private let dataManager: DataManager
    
    init(viewModel: VideoListingViewModel,dataManager: DataManager) {
        self.viewModel = viewModel
        self.dataManager = dataManager
    }
    
    override func start() {
        
        setUpBindings()

        let viewController = VideoListingVC.instantiate()
        viewController.viewModel = viewModel
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Flow Methods
    func coordinateToSettings(tabbarbutton: UIBarButtonItem) {
        removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(SettingsPopoverCoordinator.self)!
        coordinator.navigationController = navigationController
        
        let settingvc = coordinator.navigationController.visibleViewController
        settingvc?.modalPresentationStyle = UIModalPresentationStyle.popover
        let popvc = settingvc?.popoverPresentationController
        popvc?.permittedArrowDirections = UIPopoverArrowDirection.any
        popvc?.barButtonItem = tabbarbutton
        settingvc?.preferredContentSize = CGSize.init(width: 214, height: 300)
        
        start(coordinator: coordinator)
        
        
    }
    
    private func setUpBindings() {
        viewModel.onVideoTapAction
            .subscribe(onNext:{[weak self] videoListItem in
                self?.showYoutubePlayer(videoItem: videoListItem)
            })
            .disposed(by: disposeBag)
    }
    
    func showYoutubePlayer(videoItem: VideoListingModel) {
        self.dataManager.set(key: SettingKey.videoItem, value: videoItem)
        
        let coordinator = AppDelegate.container.resolve(YouTubePlayerCoordinate.self)!
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
    
    func shwoSideMenu() {
        
        let coordinator = AppDelegate.container.resolve(CategoriesSideMenuCoordinator.self)!
        coordinator.navigationController = UINavigationController()
        start(coordinator: coordinator)
    }
    
}
