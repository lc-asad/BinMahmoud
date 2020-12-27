//
//  SettingsPopoverViewModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 13/12/2020.
//

import Foundation
import RxSwift

struct SettingsPopoverViewModel {
    
    private var settingListModelSubject = PublishSubject<[SettingsPopoverModel]>()
    var settingListModelObservable: Observable<[SettingsPopoverModel]> {
        return settingListModelSubject
    }
    
    let isUpdated = BehaviorSubject(value: 0)
    
    func initializeSettingItems(){
        
        settingListModelSubject.onNext([
            SettingsPopoverModel(setting_id: 1, title: "عرض قفص", image_name: "grid_icon", selected: false),
            SettingsPopoverModel(setting_id: 2, title: "عرض جدول", image_name: "list_icon", selected: false),
            SettingsPopoverModel(setting_id: 3,title: "الأحدث", image_name: "radio", selected: false),
            SettingsPopoverModel(setting_id: 4, title: "الأكثر مشاهدة", image_name: "radio", selected: false),
            SettingsPopoverModel(setting_id: 5, title: "الإسم", image_name: "radio", selected: false)
        ])
    }
    
    func updateSelectedItem(item: SettingsPopoverModel) {
        
        item.selected = true
        isUpdated.onNext(item.setting_id)
    }
}
