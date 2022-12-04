//
//  ProfileViewController.swift
//  Danime
//
//  Created by Dias Gazim on 24.11.2022.
//

import Foundation
import SnapKit


class ProfileViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ProfileViewController"
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller_default()
        setupViews()
        setupConstraints()
        
    }
    
    private func controller_default() {
        view.backgroundColor = .systemBlue
    }
}


private extension ProfileViewController {
    func setupViews() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
