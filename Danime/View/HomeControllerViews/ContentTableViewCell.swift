//
//  ContentTableViewCell.swift
//  Danime
//
//  Created by Dias Gazim on 26.11.2022.
//

import UIKit
import SnapKit


class ContentTableViewCell: UITableViewCell {
    private var models = [MovieModel]()
    
    private let collectionView: UICollectionView
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Top 10 movies this week"
        title.font = .boldSystemFont(ofSize: 20)
        return title
    }()
    
    lazy var seeAllButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        btn.tintColor = .black
        btn.setTitleColor(hexStringToUIColor(hex: "E21221"), for: UIControl.State.normal)
        btn.setTitle("See all", for: .normal)
        
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.layer.borderWidth = 0
        collectionView.layer.borderColor = hexStringToUIColor(hex: "000000").cgColor
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: Constants.Identifiers.MovieCollectionViewCell)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with models: MovieCategoryModel) {
        self.models = models.movies
        titleLabel.text = models.categoryTitle
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Delegate and DataSource collectionview

extension ContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifiers.MovieCollectionViewCell,
            for: indexPath) as! MovieCollectionViewCell
//        let gesture = UIGestureRecognizer(target: cell, action: #selector(didTapMovie(sender: )))
//        contentView.addGestureRecognizer(gesture)
//
        cell.configure(with: model)
        return cell
    }
    
    @objc func didTapMovie(sender: AnyObject) {
        print("JJJJJJJJJ")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}


// MARK: - Extension for setup views and constraints
extension ContentTableViewCell {
    func setupViews() {
        self.contentView.addSubview(collectionView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(seeAllButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(10)
        }
        seeAllButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-3)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
