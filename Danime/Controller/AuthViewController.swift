//
//  ViewController.swift
//  Danime
//
//  Created by Dias Gazim on 24.11.2022.
//

import UIKit
import SnapKit


class AuthViewController: UIViewController {
    
    private let auth_header: UILabel = {
        let auth_header = UILabel()
        auth_header.text = "Let's you in"
        auth_header.font = .boldSystemFont(ofSize: 30)
        return auth_header
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Login", for: .normal)
        button.backgroundColor = hexStringToUIColor(hex: "E21221")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller_default()
        
        setupViews()
        setupConstraints()
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func controller_default() {
        view.backgroundColor = .white
    }
    
    @objc func didTapButton() {
        let tabBarVC = UINavigationController(rootViewController: MainTabBarController())
        
        tabBarVC.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(tabBarVC, animated: true)
//        navigationController?.navigationItem.hidesBackButton = true
        
        
        self.present(tabBarVC, animated: true)
    }
}


private extension AuthViewController {
    
    func setupViews() {
        view.addSubview(auth_header)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        auth_header.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.4)
        }
        
        button.center = view.center
        
    }
}
