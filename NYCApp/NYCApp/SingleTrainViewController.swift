//
//  SingleTrainViewController.swift
//  NYCApp
//
//  Created by Steven Li on 2/19/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import Foundation
import MaterialComponents.MaterialBottomNavigation

class SingleTrainViewController: TrainViewBarViewController {
    
    var selectedTrain: String  = ""

    override func viewDidLoad() {
      super.viewDidLoad()
        self.navigationItem.title = selectedTrain + " Train"
        bottomNavBar.delegate = self
        
      // Disable inclusion of safe area in size calculations.
    }
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem)
        {
            print( "did select item \(item.tag)" )

            //self.viewControllers?[item.tag].addChildViewController( appBar.headerViewController )
            //self.selectedViewController = self.viewControllers?[item.tag]

    //      self.viewControllers
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
