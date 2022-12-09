//
//  ExploreViewController.swift
//  Danime
//
//  Created by Dias Gazim on 24.11.2022.
//

import Foundation
import SnapKit


class ExploreViewController: UIViewController {
    
    private var models = [
        MovieModel(title: "Green lantern", imageName: "patt", rate: 8.1),
        MovieModel(title: "Starting from scratch", imageName: "patt", rate: 10),
        MovieModel(title: "War z", imageName: "patt", rate: 2.3),
        MovieModel(title: "He", imageName: "patt", rate: 3.1),
        MovieModel(title: "She", imageName: "patt", rate: 8.4),
        MovieModel(title: "Hulk", imageName: "patt", rate: 5.1),
        MovieModel(title: "Avengers", imageName: "patt", rate: 8.4),
        MovieModel(title: "Deadpool", imageName: "patt", rate: 8.4),
        MovieModel(title: "Thor", imageName: "patt", rate: 8.4),
        MovieModel(title: "Batman", imageName: "patt", rate: 8.4),
    ]

    private var collectionView: UICollectionView? 

    override func viewDidLoad() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 170, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        
        super.viewDidLoad()
       
        controller_default()
        setupViews()
        setupConstraints()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.layer.borderWidth = 0
        collectionView?.layer.borderColor = hexStringToUIColor(hex: "000000").cgColor
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        
        collectionView?.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: Constants.Identifiers.MovieCollectionViewCell)
        collectionView?.register(ExploreReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: Constants.Identifiers.HeaderExploreReusableView)
        
    }
    
    private func controller_default() {
        view.backgroundColor = .white
    }
}


// MARK: - Delegate and DataSource collectionview
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

        cell.frame.size.width = view.bounds.width / 2.2
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Constants.Identifiers.HeaderExploreReusableView,
            for: indexPath
        ) as! ExploreReusableView
        
        header.configure()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 80)
    }
}


private extension ExploreViewController {
    func setupViews() {
        view.addSubview(collectionView!)
    }
    
    func setupConstraints() {
        collectionView!.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-40)
            make.trailing.bottom.leading.equalToSuperview()
//            make.edges.equalToSuperview()
        }
    }
}
