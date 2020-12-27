//
//  YouTubePlayerCoordinate.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 16/12/2020.
//

import Foundation
import RxSwift

class YouTubePlayerCoordinate: BaseCoordinator {
    
    var YouTubePlayerNavigationViewController: UINavigationController!
    private let disposeBag = DisposeBag()
    private var viewModel: YouTubePlayerViewModel
    private var dataManager: DataManager
    
    init(viewModel: YouTubePlayerViewModel, dataManager: DataManager) {
        self.viewModel = viewModel
        self.dataManager = dataManager
    }
    
    func setupBindings() {
        
        self.viewModel.didTapFinish
            .subscribe(onNext: { [weak self] in self?.didFinishOnVideo() })
            .disposed(by: disposeBag)
    }
    
    override func start() {
        setupBindings()
        
        let viewController = YouTubePlayerVC.instantiate()
        viewController.viewModel = viewModel
        
        YouTubePlayerNavigationViewController = UINavigationController(rootViewController: viewController)
        YouTubePlayerNavigationViewController.navigationBar.isHidden = true
        YouTubePlayerNavigationViewController.modalPresentationStyle = .fullScreen
        navigationController.presentOnTop(YouTubePlayerNavigationViewController, animated: true)

    }
    
    private func didFinishOnVideo() {
       
        YouTubePlayerNavigationViewController.dismiss(animated: true, completion: nil)
        parentCoordinator?.didFinish(coordinator: self)
        self.dataManager.remove(key: SettingKey.videoItem)
    }

}
