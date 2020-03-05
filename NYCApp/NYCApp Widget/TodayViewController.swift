//
//  TodayViewController.swift
//  NYCApp Widget
//
//  Created by Steven Li on 2/24/20.
//  Copyright © 2020 Andy Zheng. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults(suiteName: "group.andyzheng.NYCApp")

        // Check for null value before setting
        if let restoredValue = defaults!.string(forKey: "alarmTime") {
            myLabel.text = restoredValue
        }
        else {
            myLabel.text = "Cannot find value"
        }


        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
