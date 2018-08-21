//
//  Title1.swift
//  wanwan
//
//  Created by 山本有紗 on 2018/08/18.
//  Copyright © 2018年 山本有紗. All rights reserved.
//

import Foundation
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var startDatepickerView: UIDatePicker!
    @IBOutlet var endDatepickerView: UIDatePicker!
    @IBOutlet var dogpickerView: UIPickerView!
    
    @IBAction func save() {
        //userDefaultを呼び出し
        let userDefault =  UserDefaults.standard
        // いま保存されているscheduleの配列
        var schedules = userDefault.array(forKey: "schedule") ?? []
        
        let schedule = [
            "title": titleTextField.text,
            "start": startDatepickerView.date,
            "end": endDatepickerView.date,
            "dog": dogpickerView.numberOfComponents
            ] as [String : Any]
        
        schedules.append(schedule)
        //値をset
        userDefault.set(schedules, forKey: "schedule")

        
        print(userDefault.value(forKey: "schedule"))
        
    }
    
    
}
