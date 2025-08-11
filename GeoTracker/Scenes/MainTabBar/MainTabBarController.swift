//
//  MainTabBarController.swift
//  GeoTracker
//
//  Created by iOS Developer on 07/08/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    }
    
    //MARK: - Setup tabBar
    private func setupTab(){
        let allCountriesVC = UINavigationController(rootViewController: CountryListRouter.createModule())
        allCountriesVC.tabBarItem = UITabBarItem(title: "Countries", image: UIImage(systemName: "globe"), tag: 0)
        
        let favoritesVC = UINavigationController(rootViewController: FavoritesRouter.createModule())
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 1)
        
        viewControllers = [allCountriesVC, favoritesVC]
        
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemMaterialLight)
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
    }

}
