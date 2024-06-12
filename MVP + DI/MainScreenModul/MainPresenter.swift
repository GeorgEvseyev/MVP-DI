//
//  MainPresenter.swift
//  MVP + DI
//
//  Created by Георгий Евсеев on 19.05.24.
//

import UIKit

protocol IMainPresenter: AnyObject {
    func parse(data: Data)
    func buttonPressed()
}

protocol MainPresenterDelegate: AnyObject {
    func setLabelText(_ text: String)
}

final class MainPresenter {
    
    weak var delegate: MainPresenterDelegate?
    private let router: IMainRouter?
    var networkManager: INetworkManager?
    init(router: IMainRouter?, networkManager: INetworkManager?) {
        self.router = router
        self.networkManager = networkManager
    }
}

extension MainPresenter: IMainPresenter {
    func parse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data) as? [Any] {
            delegate?.setLabelText("json: \(json)")
        }
    }

    func buttonPressed() {
        networkManager?.sendRequest(adress: UrlString().baseUrlString, completion: { data, _ in
            if let data = data {
                self.parse(data: data)
            }
        })
    }
}
