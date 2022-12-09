//
//  HomeViewController.swift
//  Danime
//
//  Created by Dias Gazim on 24.11.2022.
//

import Foundation
import SnapKit


// MARK: - HomeViewController
class HomeViewController: UIViewController {
    private var category_movies = [MovieCategoryModel]()
    
    lazy var contentTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.backgroundColor = .clear
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        let headerView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 275))
        tableView.tableHeaderView = headerView
        print("Watching some bounds")
        print(view.bounds.size.height * 0.3)
        tableView.tableHeaderView?.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.top)
            make.height.equalTo(view.bounds.size.height * 0.3)
            make.width.equalToSuperview()
        }

        tableView.register(ContentTableViewCell.self,
                           forCellReuseIdentifier: Constants.Identifiers.ContentTableViewCell)
        return tableView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "HomeViewController"
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller_default()
        
        setupModels()
        
        setupViews()
        setupConstraints()
        
        setTableViewDelegates()
    }
    
    private func controller_default() {
    }
    
    private func setupModels() {
        category_movies.append(contentsOf: [
            MovieCategoryModel(categoryTitle: "Top 10 Movies This Week",
                               movies: [
                                MovieModel(title: "Green lantern", imageName: "patt", rate: 8.1),
                                MovieModel(title: "Starting from scratch", imageName: "patt", rate: 10),
                                MovieModel(title: "War z", imageName: "patt", rate: 2.3),
                                MovieModel(title: "He", imageName: "patt", rate: 3.1),
                                MovieModel(title: "She", imageName: "patt", rate: 8.4),
                                MovieModel(title: "No", imageName: "patt", rate: 9.3),
                                MovieModel(title: "IT", imageName: "patt", rate: 5.6),
                                MovieModel(title: "JL", imageName: "patt", rate: 8.1),
                                MovieModel(title: "Dum", imageName: "patt", rate: 7.1),
                               ]),
            MovieCategoryModel(categoryTitle: "New relaeses",
                               movies: [
                                MovieModel(title: "Star wars", imageName: "patt"),
                                MovieModel(title: "Starting from scratch", imageName: "patt"),
                                MovieModel(title: "War z", imageName: "patt"),
                                MovieModel(title: "He", imageName: "patt"),
                                MovieModel(title: "She", imageName: "patt"),
                               ]),
            MovieCategoryModel(categoryTitle: "New Year Tops",
                               movies: [
                                MovieModel(title: "Something", imageName: "patt"),
                                MovieModel(title: "Banda", imageName: "patt"),
                                MovieModel(title: "War z", imageName: "patt"),
                                MovieModel(title: "He", imageName: "patt"),
                                MovieModel(title: "She", imageName: "patt"),
                               ])
        ])
    }
    
    private func setTableViewDelegates() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
    }
}


// MARK: - Delegate and DataSource UITableView.
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return category_movies.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContentTableViewCell()
        cell.configure(with: category_movies[indexPath.section])
        cell.layer.borderColor = hexStringToUIColor(hex: "FFFFFF").cgColor
        cell.layer.borderWidth = 1
        
        let seeAllBtn: UIButton = cell.seeAllButton
        seeAllBtn.tag = indexPath.section
        seeAllBtn.addTarget(self,
                            action: #selector(tapSeeAllBtn(sender: )),
                            for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    @objc func tapSeeAllBtn(sender: AnyObject) {
        let allMovieVC = AllMovieController()
        allMovieVC.modalPresentationStyle = .fullScreen
        allMovieVC.configure(with: category_movies[sender.tag])
        
        navigationController?.pushViewController(allMovieVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}


// MARK: - Extension for setup constraints and views.
private extension HomeViewController {
    func setupViews() {
        view.addSubview(contentTableView)
    }
    
    func setupConstraints() {
        contentTableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(-40)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}
