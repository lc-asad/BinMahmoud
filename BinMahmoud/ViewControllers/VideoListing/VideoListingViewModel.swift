//
//  VideoListingViewModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 10/12/2020.
//

import Foundation
import RxSwift

struct VideoListingViewModel {
    
    private let disposeBag = DisposeBag()
    private let dataFetchService: DataFetcher
    let isLoading = BehaviorSubject(value: true)
    let settingsAction = BehaviorSubject(value: UIBarButtonItem())
    let onVideoTapAction = PublishSubject<VideoListingModel>()
    
    private var videoListModelSubject = PublishSubject<[VideoListingModel]>()
    
    var videoListModelObservable: Observable<[VideoListingModel]> {
        return videoListModelSubject
    }
    
    init(dataFetcher: DataFetcher) {
        self.dataFetchService = dataFetcher
    }
    
    func getVedioList() {
        isLoading.onNext(true)
        self.dataFetchService.fetch(apiEndPoint: AuthEndpoint.videos(seach: "", languageId: 0, categoryId: 0), isHeader: false) { (result: Response<VideoListingResponse>) in
            isLoading.onNext(false)
            switch result {
            case .success(let response):
                self.videoListModelSubject.onNext(response.data)
            case .failure(let error):
                    print(error)
            }
        }
    }
    
    func sortListBy(itemId: Int) {
        
        videoListModelObservable.map({(items) -> [VideoListingModel] in return
            items.sorted(by: { (item1,item2) -> Bool in
                return item1.views ?? 0 > item2.views ?? 0
            })
        }).subscribe(onNext: { nextElement in
            self.videoListModelSubject.onNext(nextElement)
        }).disposed(by: disposeBag)
    }
    
}

