//
//  SettingsPopover+Extension.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 13/12/2020.
//

import Foundation
import UIKit

extension SettingsPopoverVC : UITableViewDelegate {
    
    func setupUI() {
        
        if Reference.IS_IPAD {
            tblSettings.rowHeight = 90
        }
        else {
            tblSettings.rowHeight = 60
        }
    }
    
    
}


