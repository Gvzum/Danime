//
//  DownloadViewController.swift
//  Danime
//
//  Created by Dias Gazim on 24.11.2022.

import Foundation
import SnapKit


class DownloadViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "DownloadViewController"
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
        view.backgroundColor = .black
    }
}


private extension DownloadViewController {
    func setupViews() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
