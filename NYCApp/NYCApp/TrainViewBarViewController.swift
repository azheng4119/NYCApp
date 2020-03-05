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
    let home = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
    let train = UITabBarItem(title: "Trains", image: UIImage(systemName: "tram.fill"), tag: 1)
    let map = UITabBarItem(title: "Maps", image: UIImage(systemName: "map.fill"), tag: 2)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bottomNavBar)
        bottomNavBar.titleVisibility = .always
        bottomNavBar.alignment = .centered
        bottomNavBar.items = [ home, train, map ]
    }
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem){
        print( "did select item \(item.tag)" )
        switch item.tag{
        case 0:
            self.navigationController?.popToRootViewController(animated: false)
        case 1:
            let TrainViewController = self.storyboard!.instantiateViewController(withIdentifier: "TrainView") as! TrainViewController
            self.navigationController!.pushViewController(TrainViewController, animated: false)
        case 2:
            let MapViewController = self.storyboard!.instantiateViewController(withIdentifier: "MapView") as! MapViewController
            self.navigationController!.pushViewController(MapViewController, animated: false)
        default:
            break
        }
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
