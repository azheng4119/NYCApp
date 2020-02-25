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

class SingleTrainViewController: TrainViewBarViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    var selectedTrain: String  = ""
    let arr = ["42nd Street","Hunter College","Other Stops"]

    override func viewDidLoad() {
      super.viewDidLoad()
        self.navigationItem.title = selectedTrain + " Train"
        TableView.dataSource = self
        TableView.delegate = self
        bottomNavBar.delegate = self
        bottomNavBar.selectedItem = train

      // Disable inclusion of safe area in size calculations.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SingleTrainStationViewController = self.storyboard!.instantiateViewController(withIdentifier: "SingleTrainStationView") as! SingleTrainStationViewController
        SingleTrainStationViewController.selectedStation = arr[indexPath.row]
        self.navigationController?.pushViewController(SingleTrainStationViewController, animated: true)
        TableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        cell.textLabel!.text = arr[indexPath.row]
        return cell
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
