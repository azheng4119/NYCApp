//
//  ViewController.swift
//  NYCApp
//
//  Created by Andy Zheng on 2/10/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation

class ViewController: TrainViewBarViewController {

    @IBOutlet weak var trainAndBusViewControl: UISegmentedControl!
        
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Trains"
        bottomNavBar.delegate = self
//        toggleMode(trainAndBusViewControl)
    }
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem)
        {
            print( "did select item \(item.tag)" )
            let TrainViewController = self.storyboard!.instantiateViewController(withIdentifier: "TrainView") as! TrainViewController
            self.navigationController!.pushViewController(TrainViewController, animated: true)

            //self.viewControllers?[item.tag].addChildViewController( appBar.headerViewController )
            //self.selectedViewController = self.viewControllers?[item.tag]

    //      self.viewControllers
        }
    
    

    @IBAction func toggleMode(_ sender: UISegmentedControl){
        switch trainAndBusViewControl.selectedSegmentIndex{
        case 0:
            self.navigationItem.title = "Trains"
            let TrainViewController = self.storyboard!.instantiateViewController(withIdentifier: "TrainView") as! TrainViewController
            self.navigationController!.pushViewController(TrainViewController, animated: true)
            break
        case 1:
            self.navigationItem.title = "Buses"
            let MapViewController = self.storyboard!.instantiateViewController(withIdentifier: "MapView") as! MapViewController
            self.navigationController!.pushViewController(MapViewController, animated: true)
            break
        default:
            break
        }
    }

}

