//
//  DownloadTableViewCell.swift
//  Danime
//
//  Created by Dias Gazim on 08.12.2022.
//

import Foundation
import SnapKit


class DownloadTableViewCell: UITableViewCell {
    private var model = MovieModel(title: "", imageName: "")
    
    lazy var movieTitle: UILabel = {
        let title = UILabel()
        title.text = "Something"
        title.font = .boldSystemFont(ofSize: 19)
        return title
    }()
    
    lazy var movieImage: UIImageView = {
        return UIImageView()
    }()
    
    lazy var movieDuration: UILabel = {
        let duration = UILabel()
        duration.textColor = .systemGray
        duration.font = .boldSystemFont(ofSize: 16)
        return duration
    }()
    
    lazy var deleteBtn: UIButton = {
        let btn = UIButton()
        let backImg = UIImage(systemName: "trash")
        btn.setBackgroundImage(backImg, for: UIControl.State.normal)
        btn.tintColor = hexStringToUIColor(hex: "E21221")
//        btn.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var movieMemory: UILabel = {
        let memory = UILabel()
        memory.backgroundColor = hexStringToUIColor(hex: "FFC0CB")
        memory.textColor = hexStringToUIColor(hex: "F33A6A")
        memory.font = .boldSystemFont(ofSize: 12)
        memory.layer.masksToBounds = true
        memory.layer.cornerRadius = 6
        memory.textAlignment = .center
        memory.text = "2.3 Gb"
        return memory
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        controllerDefault()
    }
    
    func controllerDefault() {
        setupViews()
        setupConstraints()
        
        movieImage.layer.masksToBounds = true
        movieImage.layer.cornerRadius = 10
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(with movie: MovieModel) {
        self.model = movie
        movieTitle.text = movie.title
        movieImage.image = UIImage(named: movie.imageName)
        let answer = secondsToHoursMinutesSeconds(movie.duration)
        movieDuration.text = "\(answer.0)h \(answer.1)m \(answer.2)s"
        movieMemory.text = movie.memory
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Extension for setup views and constraints
extension DownloadTableViewCell {
    func setupViews() {
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieImage)
        contentView.addSubview(movieDuration)
        contentView.addSubview(movieMemory)
        contentView.addSubview(deleteBtn)
    }
    
    func setupConstraints() {
        movieImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(170)
        }
        movieTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(movieImage.snp.trailing).offset(15)
            make.trailing.equalToSuperview().inset(10)
        }
        movieDuration.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(10)
            make.leading.equalTo(movieImage.snp.trailing).offset(15)
        }
        movieMemory.snp.makeConstraints { make in
            make.top.equalTo(movieDuration.snp.bottom).offset(10)
            make.leading.equalTo(movieImage.snp.trailing).offset(15)
            make.width.equalTo(55)
            make.height.equalTo(30)
        }
        deleteBtn.snp.makeConstraints { make in
            make.top.equalTo(movieMemory.snp.top)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
}
