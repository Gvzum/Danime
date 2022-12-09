//
//  AllMovieController.swift
//  Danime
//
//  Created by Dias Gazim on 03.12.2022.
//

import Foundation
import SnapKit


class AllMovieController: UIViewController {
    private var collectionView: UICollectionView?
    private var movies = [MovieModel]()
    
    override func viewDidLoad() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 170, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        
        super.viewDidLoad()
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
    
    func configure(with model: MovieCategoryModel) {
        title = model.categoryTitle
        self.movies = model.movies
    }
}


// MARK: - Delegate and DataSource collectionview
extension AllMovieController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = movies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifiers.MovieCollectionViewCell,
            for: indexPath) as! MovieCollectionViewCell

        cell.frame.size.width = view.bounds.width / 2.1
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 80)
    }
}


// MARK: - Extension AllMovieController
private extension AllMovieController {
    func setupViews() {
        view.addSubview(collectionView!)
    }
    
    func setupConstraints() {
        collectionView?.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(-60)
            make.leading.trailing.bottom.equalToSuperview()
        })
    }
}
