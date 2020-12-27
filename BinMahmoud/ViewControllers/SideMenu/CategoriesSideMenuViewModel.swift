//
//  CategoriesSideMenuViewModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 21/12/2020.
//

import Foundation
import RxSwift

struct CategoriesSideMenuViewModel {

    private let disposeBag = DisposeBag()
    private let dataFetchService: DataFetcher
    let isLoading = BehaviorSubject(value: true)
    
    private var categoriesListModelSubject = PublishSubject<[CategoriesSideMenuModel]>()
    
    var categoriesListModelObservable: Observable<[CategoriesSideMenuModel]> {
        return categoriesListModelSubject
    }
    
    init(dataFetcher: DataFetcher) {
        self.dataFetchService = dataFetcher
    }
    
    func getCategoriesList() {
        isLoading.onNext(true)
        self.dataFetchService.fetch(apiEndPoint: AuthEndpoint.categories(search: "", languageId: 1), isHeader: false) { (result: Response<CategoriesSideMenuResponse>) in
            isLoading.onNext(false)
            switch result {
            case .success(let response):
                self.categoriesListModelSubject.onNext(response.data)
            case .failure(let error):
                    print(error)
            }
        }
    }
}


