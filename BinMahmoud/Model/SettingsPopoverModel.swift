//
//  SettingsPopoverModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 13/12/2020.
//

import Foundation

class SettingsPopoverModel {
    
    var setting_id : Int
    var title: String
    var image_name: String
    var selected: Bool
    
    init(setting_id: Int, title: String, image_name: String, selected: Bool) {
        
        self.setting_id = setting_id
        self.title = title
        self.image_name = image_name
        self.selected = selected
    }
    
}
