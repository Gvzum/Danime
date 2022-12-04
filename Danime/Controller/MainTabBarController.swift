//
//  MainTabBarController.swift
//  Danime
//
//  Created by Dias Gazim on 25.11.2022.
//

import Foundation
import SnapKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarAppearence()
        
        view.backgroundColor = .white
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HomeViewController(), title: "Home", image: UIImage(systemName: "house.fill")),
            generateVC(viewController: ExploreViewController(), title: "Explore", image: UIImage(systemName: "safari")),
            generateVC(viewController: MyListViewController(), title: "My List", image: UIImage(systemName: "bookmark")),
            generateVC(viewController: DownloadViewController(), title: "Download", image: UIImage(systemName: "square.and.arrow.up")),
            generateVC(viewController: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person.fill")),
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearence() {
        let posY: CGFloat = 20
        let height = tabBar.bounds.height + posY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: 0,
                                y: -5,
                                width: tabBar.bounds.width,
                                height: height),
            cornerRadius: 15)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = tabBar.bounds.width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = hexStringToUIColor(hex: "FFFFFF").cgColor
        
        tabBar.tintColor = hexStringToUIColor(hex: "E21221")
    }
}


private extension MainTabBarController {
    func setupViews() {
    }
    
    func setupConstraints() {
    }
}
