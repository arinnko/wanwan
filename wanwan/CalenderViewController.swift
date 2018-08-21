//
//  CalenderViewController.swift
//  wanwan
//
//  Created by 山本有紗 on 2018/01/11.
//  Copyright © 2018年 山本有紗. All rights reserved.
//

import UIKit
import FSCalendar

class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var calenderView:FSCalendar!
    
    var date: Date?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calenderView.delegate = self
        calenderView.dataSource = self
        
        calenderView.appearance.titleTodayColor = UIColor(red: 230.0/255.0, green: 115.0/255.0, blue: 155.0/255.0, alpha: 100)
        calenderView.appearance.headerTitleColor = UIColor(red: 230.0/255.0, green: 115.0/255.0, blue: 155.0/255.0, alpha: 100)
        calenderView.appearance.eventColor = UIColor(red: 230.0/255.0, green: 168.0/255.0, blue: 218.0/255.0, alpha: 100)
        calenderView.appearance.selectionColor = UIColor(red: 230.0/255.0, green: 115.0/255.0, blue: 155.0/255.0, alpha: 100)
        calenderView.appearance.todayColor = UIColor(red: 170.0/255.0, green: 150.0/255.0, blue: 218.0/255.0, alpha: 100)
        calenderView.appearance.todaySelectionColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 100)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: FSCalendar, hasEventFor date: Date) -> Bool {
        let userDefault =  UserDefaults.standard
        guard let schedules = userDefault.array(forKey: "schedule") as? [[String: Any]] else { return false }
        let todaySchedule = schedules.filter { schedule in
            if let start = schedule["start"] as? Date,
                let end = schedule["end"] as? Date {
                return date > start && end > date
            } else {
                return false
            }
        }.first
        if todaySchedule == nil{
            return false
        } else {
            return true
        
        }
        
    }
   
    //
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = date
        performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let ScheduleViewController = segue.destination as! ScheduleViewController
            ScheduleViewController.date = self.date
        }
        
    }

}
