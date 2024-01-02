//
//  AppTabNavigator.swift
//  criptoMoneyApp
//
//  Created by Nahuel Paez on 18/10/2023.
//

import Foundation
import UIKit


import UIKit

class CustomTabBarController: UITabBarController {
    lazy var topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setTopView()
    }
    
    private func setStyle() {
        tabBar.unselectedItemTintColor = UIColor.white
        tabBar.tintColor = UIColor.gray
        tabBar.backgroundColor = AppColors.White3
        setTabAppearance()
    }
    
    private func setTopView() {
        tabBar.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.tabBar.topAnchor),
            topView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 20),
            topView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -20)]
        )
    }
    
    private func setTabAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = AppColors.MainGray
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = AppColors.MainBlue
        self.tabBar.standardAppearance = tabBarAppearance
    }
}

class TabBarControllerBuild {
    
   static func setupCustomTabBarController() -> CustomTabBarController {
        let homeVc = homeVCBuild()
        let favVc = favVCBuild()
       
        let tabBarController = CustomTabBarController()
        tabBarController.viewControllers = [homeVc,favVc]
        return tabBarController
    }
    
    private static func homeVCBuild() -> UIViewController{
        let homeViewController = HomeViewControllerFactory.build()
        homeViewController.tabBarItem.title = "Inicio"
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        return homeViewController
    }
    
    private static func favVCBuild()-> UIViewController {
        let favViewController = FavoriteCryptocurrenciesViewControllerFactory.build()
        favViewController.tabBarItem.title = "Favorites"
        favViewController.tabBarItem.image = UIImage(systemName: "star")
        favViewController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        
        return favViewController
    }
}
