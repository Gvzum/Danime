//
//  DownloadViewController.swift
//  Danime
//
//  Created by Dias Gazim on 24.11.2022.

import Foundation
import SnapKit


class DownloadViewController: UIViewController {
    private var models = [
        MovieModel(title: "Green lantern", imageName: "patt", rate: 8.1, memory: "1.4 Gb"),
        MovieModel(title: "Starting from scratch", imageName: "patt", rate: 10, memory: "0"),
        MovieModel(title: "War z", imageName: "movie-back", rate: 2.3, memory: "1.3 Gb", duration: 12311),
        MovieModel(title: "He", imageName: "patt", rate: 3.1),
        MovieModel(title: "She", imageName: "patt", rate: 8.4),
        MovieModel(title: "Hulk", imageName: "patt", rate: 5.1),
        MovieModel(title: "Avengers", imageName: "patt", rate: 8.4),
        MovieModel(title: "Deadpool", imageName: "patt", rate: 8.4),
        MovieModel(title: "Thor", imageName: "patt", rate: 8.4),
        MovieModel(title: "Batman", imageName: "patt", rate: 8.4),
    ]
    
    lazy var downloadTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.backgroundColor = .clear
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DownloadTableViewCell.self,
                           forCellReuseIdentifier: Constants.Identifiers.DownloadTableViewCell)
        return tableView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        controller_default()
        setupViews()
        setupConstraints()
        setTableViewDelegates()
    }
    
    private func controller_default() {
        view.backgroundColor = .white
    }
    
    private func setTableViewDelegates() {
        downloadTableView.delegate = self
        downloadTableView.dataSource = self
    }
}


// MARK: - Delegate and DataSource UITableView.
extension DownloadViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DownloadTableViewCell()
        cell.configure(with: models[indexPath.section])
        
        let deleteBtn: UIButton = cell.deleteBtn
        deleteBtn.tag = indexPath.section
        deleteBtn.addTarget(self,
                            action: #selector(deleteMovieFromDownloads(sender: )),
                            for: .touchUpInside)
        return cell
    }
    
    @objc func deleteMovieFromDownloads(sender: AnyObject) {
        print("I am deleting know")
        self.models.remove(at: sender.tag!)
        downloadTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}


// MARK: - Extension for setup constraints and views.
private extension DownloadViewController {
    func setupViews() {
        view.addSubview(downloadTableView)
    }
    
    func setupConstraints() {
        downloadTableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(-40)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}
