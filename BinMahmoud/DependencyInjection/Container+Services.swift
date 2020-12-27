//
//  Container+Services.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 11/12/2020.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() {
        
        autoregister(DataManager.self, initializer: UserDataManager.init).inObjectScope(.container)
        autoregister(Networking.self, initializer: HTTPNetworking.init).inObjectScope(.container)
        autoregister(DataFetcher.self, initializer: FetchService.init).inObjectScope(.container)
    }
}
