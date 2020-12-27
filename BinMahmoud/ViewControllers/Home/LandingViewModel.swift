//
//  LandingViewModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 11/12/2020.
//

import Foundation
import RxSwift

struct LandingViewModel {
    
    let didSelectIndex = BehaviorSubject(value: 0)
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
}
