//
//  DIContainer.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation


class DIContainer {
    static let shared = DIContainer()

    private init() {}

    // Registra las implementaciones concretas y sus inyecciones de dependencias
    //private let dataStorage: DataStorage = LocalDataStorage()
    //private let webService: TaskWebService = RemoteTaskWebService()

    //func resolveTaskRepository() -> TaskRepository {
      //  return TaskRepositoryImpl(dataStorage: dataStorage, webService: webService)
   // }
}
