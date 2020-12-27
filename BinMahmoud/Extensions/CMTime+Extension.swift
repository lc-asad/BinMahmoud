//
//  CMTime+Extension.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 12/12/2020.
//

import CoreMedia

extension CMTime {
    var timeString: String {
        let sInt = Int(seconds)
        let s: Int = sInt % 60
        let m: Int = (sInt / 60) % 60
        let h: Int = sInt / 3600
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
    
}
