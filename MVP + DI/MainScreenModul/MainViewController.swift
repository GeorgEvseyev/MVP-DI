//
//  MainViewController.swift
//  MVP + DI
//
//  Created by Георгий Евсеев on 19.05.24.
//

import UIKit



class MainViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: IMainPresenter?
    init(presenter: IMainPresenter? = nil) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .orange
        
        view.addSubview(label)
        label.backgroundColor = .white
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        view.addSubview(button)
        let action = UIAction { _ in
            self.buttonPressed()
        }
        button.addAction(action, for: .touchUpInside)
        button.backgroundColor = .blue
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    
    func buttonPressed() {
        presenter?.buttonPressed()
    }
}

extension MainViewController: MainPresenterDelegate {
    func setLabelText(_ text: String) {
        DispatchQueue.main.async {
            self.label.text = text
        }
    }
}
