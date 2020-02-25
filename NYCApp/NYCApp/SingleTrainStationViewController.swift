//
//  SingleTrainStationViewController.swift
//  NYCApp
//
//  Created by Steven Li on 2/19/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit

class SingleTrainStationViewController: TrainViewBarViewController {

    var selectedStation : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedStation
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bottomNavBar.selectedItem = train
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
