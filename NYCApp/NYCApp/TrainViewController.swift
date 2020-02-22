//
//  TrainViewController.swift
//  NYCApp
//
//  Created by Steven Li on 2/11/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import SwiftyJSON

class TrainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var TableView: UITableView!
    
    let arr = ["1","2","3","4","5","6","7","A","B","C","D","E","F","G","H","J","M","N","Q","R","S","W","Z"]
    var northBound : JSON = [:]
    var southBound : JSON = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        request()
        // Do any additional setup after loading the view.
    }
    
    enum Test: Error {
        case HTTPRequestError
        case DataIsNil
        case BadJSONResponse
    }

    func request(){
        let url = URL(string: "https://mta-real-time.herokuapp.com/trains/6/628")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil{
                print("HTTP Request Error")
            }
            if let data = data {
                print(JSON(data)["northBound"])
                self.northBound = JSON(data)["northBound"]
                self.refresh()
            }
        })
        task.resume()

    }

    func refresh() {
        DispatchQueue.main.async(
            execute: {
                self.TableView.reloadData()
            })
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Train: \(arr[indexPath.row])")
        let SingleTrainViewController = self.storyboard!.instantiateViewController(withIdentifier: "SingleTrainView") as! SingleTrainViewController
        SingleTrainViewController.selectedTrain = arr[indexPath.row]
        self.navigationController!.pushViewController(SingleTrainViewController, animated: true)
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
        cell.textLabel!.text = arr[indexPath.row]
        return cell
    }

}
