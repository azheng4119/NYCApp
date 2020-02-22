//
//  TrainViewBarViewController.swift
//  NYCApp
//
//  Created by Steven Li on 2/22/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import Foundation
import MaterialComponents.MaterialBottomNavigation

class TrainViewBarViewController: UIViewController, MDCBottomNavigationBarDelegate {

    let bottomNavBar = MDCBottomNavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bottomNavBar)
        bottomNavBar.titleVisibility = .always
        bottomNavBar.alignment = .centered
        let tabBarItem1 = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let tabBarItem2 = UITabBarItem(title: "Messages", image: UIImage(systemName: "arrow.up.to.line"), tag: 1)
        let tabBarItem3 = UITabBarItem(title: "Favorites", image: UIImage(named: "Favorite"), tag: 2)
        bottomNavBar.items = [ tabBarItem1, tabBarItem2, tabBarItem3 ]
        bottomNavBar.selectedItem = tabBarItem1;
    }
    
    
    func layoutBottomNavBar()
    {
        let size = bottomNavBar.sizeThatFits(view.bounds.size)
        let bottomNavBarFrame = CGRect( x: 0,
                                        y: view.bounds.height - size.height,
                                        width: size.width,
                                        height: size.height )
        bottomNavBar.frame = bottomNavBarFrame
    }

    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      layoutBottomNavBar()
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
