//
//  Assembly.swift
//  MVP + DI
//
//  Created by Георгий Евсеев on 9.05.24.
//

import UIKit

class Assembly {
    func assemble() -> UIViewController {
        let networkManager = NetworkManager()
        let router = MainRouter()
        let presenter = MainPresenter(router: router, networkManager: networkManager)
        let controller = MainViewController(presenter: presenter)
        controller.presenter = presenter
        presenter.networkManager = networkManager
        presenter.delegate = controller
        return controller
    }
}
