//
//  SingleTrainStationViewController.swift
//  NYCApp
//
//  Created by Steven Li on 2/19/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import SwiftyJSON

class TrainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trainImage: UIImageView!
    @IBOutlet weak var arrivalText: UILabel!
    @IBOutlet weak var futureArrivalText: UILabel!
    
}

class SingleTrainStationViewController: TrainViewBarViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var TableView: UITableView!
    var selectedStation : String = ""
    var arr = ["a","b","c"]
    var trainStops : JSON = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomNavBar.delegate = self
        TableView.dataSource = self
        TableView.delegate = self
        TableView.rowHeight = UITableView.automaticDimension
        self.navigationItem.title = selectedStation

        // Do any additional setup after loading the view.
    }
    
    func request(){
        print(selectedStation)
        let station = selectedStation.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "http://node-express-env.hfrpwhjwwy.us-east-2.elasticbeanstalk.com/trains/\(station)")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil{
                print("HTTP Request Error")
            }
            if let data = data {
                print(JSON(data))
                print("test")
                print(JSON(data)[0])
                self.trainStops = JSON(data)
                self.reloadTable()
            }
        })
        task.resume()
    }

    func reloadTable() {
        DispatchQueue.main.async(
            execute: {
                self.TableView.reloadData()
            })
    }

    override func viewWillAppear(_ animated: Bool) {
        bottomNavBar.selectedItem = train
        request()
        
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainStops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! TrainTableViewCell
        let image = UIImage(named: "\(trainStops[indexPath.row]["TrainNumber"].stringValue)")
        cell.trainImage?.image = image
        let resizedImage = imageWithImage(image: image!, scaledToSize: CGSize(width: 50, height: 50))
        cell.trainImage?.image = resizedImage
        cell.arrivalText?.text = "soon"
//        cell.futureArrivalText?.text = "yep"
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
