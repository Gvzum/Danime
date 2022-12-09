//
//  ExploreReusableView.swift
//  Danime
//
//  Created by Dias Gazim on 04.12.2022.
//

import UIKit

class ExploreReusableView: UICollectionReusableView {

    lazy var searchInput: UITextField = {
        let searchImg = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchImg.tintColor = hexStringToUIColor(hex: "E21221")
        
        let sampleTextField =  UITextField(frame: CGRect(x: 15, y: 0,
                                                         width: bounds.width / 2,
                                                         height: 50))
        sampleTextField.addSubview(searchImg)
        searchImg.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(10)
        }
        sampleTextField.textAlignment = .center
        
        sampleTextField.placeholder = "Movie name"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.layer.borderColor = hexStringToUIColor(hex: "E21221").cgColor
        sampleTextField.layer.borderWidth = 1
        sampleTextField.layer.cornerRadius = 12
        sampleTextField.keyboardType = .asciiCapable
        sampleTextField.keyboardAppearance = .default
        sampleTextField.backgroundColor = .white
        
        return sampleTextField
    }()
    
    public func configure() {
        setupViews()
        setupConstraints()
    }
}


private extension ExploreReusableView {
    func setupViews() {
        addSubview(searchInput)
    }
    
    func setupConstraints() {
        searchInput.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            //            make.centerX.equalToSuperview()
//            make.width.equalTo(bounds.width)
            make.height.equalTo(50)
        }
    }
}
