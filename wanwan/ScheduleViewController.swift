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
                let calender = Calendar.current
                let startDate = calender.startOfDay(for: start)
                let endDate = calender.startOfDay(for: end)
                let thisDate = calender.startOfDay(for: self.date!)
                
                if startDate == endDate {
                    return thisDate == startDate
                } else {
                    return thisDate >= startDate && endDate >= thisDate
                }
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
        cell?.detailTextLabel?.text = scheduleArray[indexPath.row]["dog"] as! String
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.scheduleArray.remove(at: indexPath.row)
            let userDefault =  UserDefaults.standard
            userDefault.set(self.scheduleArray, forKey: "dogname")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "削除"
    }
    
    
    
    
    
    
}
