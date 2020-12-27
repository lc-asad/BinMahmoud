//
//  YouTubePlayerViewModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 16/12/2020.
//

import Foundation
import RxSwift

struct YouTubePlayerViewModel {
    
    private var dataManager: DataManager
    let didTapFinish = PublishSubject<Void>()
    var videoUrl: String?
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        
        guard let videoItem = dataManager.get(key: SettingKey.videoItem, type: VideoListingModel.self)
        else {return}
        
        self.videoUrl = videoItem.file_name
    }
}
