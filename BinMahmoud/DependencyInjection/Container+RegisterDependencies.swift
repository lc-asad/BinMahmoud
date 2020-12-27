//
//  Container+RegisterDependencies.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 11/12/2020.
//

import Swinject

extension Container {
    func registerDependencies() {
        registerServices()
        registerCoordinators()
        registerViewModels()
    }
}
