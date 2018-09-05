//
//  Title1.swift
//  wanwan
//
//  Created by 山本有紗 on 2018/08/18.
//  Copyright © 2018年 山本有紗. All rights reserved.
//

import Foundation
import UIKit

class PostViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var startDatepickerView: UIDatePicker!
    @IBOutlet var endDatepickerView: UIDatePicker!
    @IBOutlet var dogpickerView: UIPickerView!
    
    var selectName = ""
    
    
    var doglist: [String] = [
    ]
    
    override func viewDidLoad() {
        
        //userDefaultを呼び出し
        let userDefault =  UserDefaults.standard
        // いま保存されているscheduleの配列
        let Dogname = userDefault.array(forKey: "dogname") as? [String] ?? []
        doglist = Dogname
        // Delegate設定
        dogpickerView.delegate = self
        dogpickerView.dataSource = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if doglist.first != nil{
            selectName = doglist.first!
        } else {
            let alert: UIAlertController = UIAlertController(title: "error", message: "犬の名前を登録してください", preferredStyle: .alert)
            
            //okボタン
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                        //ボタンが押された時の動作
                        self.navigationController?.popViewController(animated: true)
                }
                )
            )
            
            present(alert, animated: true, completion: nil)
            
            
        }
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return doglist.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return doglist[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        selectName = doglist[row]
    }
    
    @IBAction func save() {
        //userDefaultを呼び出し
        let userDefault =  UserDefaults.standard
        // いま保存されているscheduleの配列
        var schedules = userDefault.array(forKey: "schedule") ?? []
        
        let schedule = [
            "title": titleTextField.text,
            "start": startDatepickerView.date,
            "end": endDatepickerView.date,
            "dog": selectName
            ] as [String : Any]
        
        schedules.append(schedule)
        //値をset
        userDefault.set(schedules, forKey: "schedule")
        
        
        print(userDefault.value(forKey: "schedule"))
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
