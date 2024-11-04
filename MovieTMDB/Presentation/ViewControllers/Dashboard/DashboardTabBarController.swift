//
//  DashboardTabBarController.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import UIKit

class DashboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configTabs()
    }
    
    private func configTabs(){
        
        let homeVC = HomeViewController()
        let favoriteVC = FavoriteViewController()
        let profileVC = ProfileViewController()
        
        homeVC.title = "Home"
        favoriteVC.title = "Favorite"
        profileVC.title = "Profile"
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let favoriteNav = UINavigationController(rootViewController: favoriteVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        favoriteNav.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), tag: 1)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        self.viewControllers = [homeNav, favoriteNav, profileNav]
        
        self.tabBar.backgroundColor = .systemGray6
        
        self.tabBar.tintColor = UIColor(hex: "#01b4e4")
        
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
