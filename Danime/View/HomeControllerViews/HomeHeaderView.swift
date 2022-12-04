//
//  HeaderView.swift
//  Danime
//
//  Created by Dias Gazim on 25.11.2022.
//

import Foundation
import SnapKit


class HomeHeaderView: UITableViewHeaderFooterView {
    lazy var backgroundImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "bataman_back"))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var header_label: UILabel = {
        let label = UILabel()
        label.text = "Danime"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var search_button: UIButton = {
        let btn = UIButton()
        let backImg = UIImage(systemName: "magnifyingglass")
        btn.setBackgroundImage(backImg, for: UIControl.State.normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var bell_button: UIButton = {
        let btn = UIButton()
        let backImg = UIImage(systemName: "bell")
        btn.setBackgroundImage(backImg, for: UIControl.State.normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func didTapSearchButton() {
        print("You tap search button")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


private extension HomeHeaderView {
    func setupViews() {
        self.addSubview(backgroundImage)
        self.addSubview(search_button)
        self.addSubview(bell_button)
        self.addSubview(header_label)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        search_button.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).multipliedBy(0.2)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
        bell_button.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).multipliedBy(0.2)
            make.trailing.equalToSuperview().inset(80)
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
        header_label.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).multipliedBy(0.2)
            make.leading.equalToSuperview().inset(40)
        }
    }
}
