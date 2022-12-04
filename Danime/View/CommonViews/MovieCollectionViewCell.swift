//
//  MovieCollectionViewCell.swift
//  Danime
//
//  Created by Dias Gazim on 26.11.2022.
//

import UIKit
import SnapKit


class MovieCollectionViewCell: UICollectionViewCell {
    lazy var labelView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var rateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.textAlignment = .center
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.font = .boldSystemFont(ofSize: 13)
        label.backgroundColor = hexStringToUIColor(hex: "E21221")
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    
    public func configure(with model: MovieModel) {
        labelView.text = model.title
        imageView.image = UIImage(named: model.imageName)
        rateLabel.text = String(model.rate)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(rateLabel)
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(35)
            make.height.equalTo(25)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 5, y: 5,
                                 width: contentView.frame.size.width - 10,
                                 height: contentView.frame.size.height - 10)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
