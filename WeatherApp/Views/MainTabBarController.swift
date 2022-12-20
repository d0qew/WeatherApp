//
//  MainTabBarController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 13.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarApperance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: FactWeatherAssembly.configure(), title: "Home", image: UIImage(systemName: "house.fill")),
            generateVC(viewController: SearchAssembly.configure(), title: "Search", image: UIImage(systemName: "magnifyingglass"))
//            generateVC(viewController: <#T##UIViewController#>, title: "Likes", image: <#T##UIImage?#>)
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarApperance() {
        let possitionOnX: CGFloat = 10
        let possitionOnY: CGFloat = 14
        let width = tabBar.bounds.width - possitionOnX * 2
        let height = tabBar.bounds.height + possitionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
        roundedRect: CGRect(x: possitionOnX, y: tabBar.bounds.minY - possitionOnY, width: width , height: height),
        cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
    }
}
