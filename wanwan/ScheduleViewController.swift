//
//  ScheduleViewController.swift
//
//
//  Created by 山本有紗 on 2018/08/19.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var date: Date?
    var scheduleArray = [[String: Any]] ()

    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        tableView.dataSource = self
        let userDefault =  UserDefaults.standard
        guard let schedules = userDefault.array(forKey: "schedule") as? [[String: Any]] else { return }
        let todaySchedule = schedules.filter { schedule in
            if let start = schedule["start"] as? Date,
                let end = schedule["end"] as? Date {
                return self.date! > start && end > self.date!
            } else {
                return false
            }
        }
        scheduleArray = todaySchedule
    }
    
    
    //Cellの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection numberOfRownsInSection: Int) -> Int {
        //cellの数をscheduleArrayの数にする
        return scheduleArray.count
        
    }
    
    // Cellに値を設定できる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //cellにscheduleArrayを表示する
        cell?.textLabel?.text = scheduleArray[indexPath.row]["title"] as! String
        
        return cell!
        
    }
    
    
    
    
    
    
}
