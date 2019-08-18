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
    let u = Util()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calenderView.delegate = self
        calenderView.dataSource = self
        
        calenderView.frame.size.width = self.view.frame.width
        
        calenderView.appearance.titleTodayColor = UIColor.black
        calenderView.appearance.headerTitleColor = u.rgb(r: 229, g: 166, b: 190)
        calenderView.appearance.eventColor = UIColor(red: 230.0/255.0, green: 168.0/255.0, blue: 218.0/255.0, alpha: 100)
        calenderView.appearance.selectionColor = UIColor(red: 230.0/255.0, green: 115.0/255.0, blue: 155.0/255.0, alpha: 100)
        calenderView.appearance.todayColor = u.todayColor
        calenderView.appearance.todaySelectionColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 100)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calenderView.reloadData()
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
                let calender = Calendar.current
                let startDate = calender.startOfDay(for: start)
                let endDate = calender.startOfDay(for: end)
                let thisDate = calender.startOfDay(for: date)
                
                if startDate == endDate {
                    return thisDate == startDate
                } else {
                    return thisDate >= startDate && endDate >= thisDate
                }
            } else {
                return false
            }
        }
        if todaySchedule.isEmpty{
            return false
        } else {
            if todaySchedule.count>2{
                return true
            }else{
                return true
            }
            
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
