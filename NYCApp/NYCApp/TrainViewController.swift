//
//  TrainViewController.swift
//  NYCApp
//
//  Created by Steven Li on 2/11/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import SwiftyJSON
import MaterialComponents.MaterialBottomNavigation

class TrainViewController: TrainViewBarViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var TableView: UITableView!
    
    let trains = ["1","2","3","4","5","6","7","A","B","C","D","E","F","G","H","J","M","N","Q","R","S","W","Z"]
    var northBound : JSON = [:]
    var southBound : JSON = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        bottomNavBar.delegate = self
        bottomNavBar.selectedItem = train
        self.navigationItem.setHidesBackButton(true, animated: true);
        self.navigationItem.title = "All Trains"
        let one = UIImage(named: "1")
        let oneView = UIImageView(image: one!)
        oneView.frame = CGRect(x: 0, y: 500, width: 50, height: 50)
        view.addSubview(oneView)
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        request()
//    }
//
//    func request(){
////        let url = URL(string: "https://mta-real-time.herokuapp.com/trains/6/628")!
//        let url = URL(string: "http://node-express-env.hfrpwhjwwy.us-east-2.elasticbeanstalk.com/trains/103%20St%20&%20Lexington%20Av")!
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//            if error != nil{
//                print("HTTP Request Error")
//            }
//            if let data = data {
//                print(JSON(data)["northBound"])
//                self.northBound = JSON(data)["northBound"]
//                self.reloadTable()
//            }
//        })
//        task.resume()
//    }

    func reloadTable() {
        DispatchQueue.main.async(
            execute: {
                self.TableView.reloadData()
            })
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trains.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Train: \(trains  [indexPath.row])")
        let SingleTrainViewController = self.storyboard!.instantiateViewController(withIdentifier: "SingleTrainView") as! SingleTrainViewController
        SingleTrainViewController.selectedTrain = trains[indexPath.row]
        self.navigationController?.pushViewController(SingleTrainViewController, animated: true)
        TableView.deselectRow(at: indexPath, animated: true)
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
//        var message = northBound[indexPath.row]["minutesArrival"].description
//        if message != "Arriving Now" { message += " Away" }
//        cell.textLabel!.text = message
//        return cell
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        cell.textLabel!.text = trains[indexPath.row]
        return cell
    }

}
