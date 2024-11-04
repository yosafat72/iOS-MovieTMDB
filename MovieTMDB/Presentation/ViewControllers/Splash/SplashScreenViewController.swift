//
//  SplashScreenViewController.swift
//  MovieTMDB
//
//  Created by Yosafat.H.S on 04/11/24.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.navigateToDashboardScreen()
        }
        
    }
    
    private func navigateToDashboardScreen() {
        let dashboard = DashboardTabBarController()

       
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = dashboard
            window.makeKeyAndVisible()
        }
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
