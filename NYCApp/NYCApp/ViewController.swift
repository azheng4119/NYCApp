//
//  ViewController.swift
//  NYCApp
//
//  Created by Andy Zheng on 2/10/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trainAndBusViewControl: UISegmentedControl!
    @IBOutlet weak var testlabel: UILabel!
    
    @IBOutlet var trainMainView: UIView!
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        toggleMode(trainAndBusViewControl)
        // Do any additional setup after loading the view.
    }
    @IBAction func toggleMode(_ sender: UISegmentedControl){
        switch trainAndBusViewControl.selectedSegmentIndex{
        case 0:
            self.navigationItem.title = "Trains"
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

