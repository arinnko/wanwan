//
//  DateStoreViewContlloer.swift
//  wanwan
//
//  Created by 山本有紗 on 2019/02/07.
//  Copyright © 2019年 山本有紗. All rights reserved.
//

import Foundation
import UIKit

class DateStoreViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //@IBOutlet var dogPicker: UIPickerView!
    //@IBOutlet var dataTextField: UITextField!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var picker: UIPickerView!
    var saveData: UserDefaults = UserDefaults.standard
    
    var weights: [Double] = []
    var dates: [Date] = []
    
    var kg = 0
    var g = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    // 列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 行の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 51
        } else {
            return 10
        }
    }
    
    // タイトル
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    // ピッカーが選択された時に呼ばれる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            kg = row
        } else {
            g = row
        }
        label.text = "\(kg).\(g)"
    }
    
    @IBAction func saveButton() {
        // 体重保存
        if saveData.array(forKey: "weights") != nil {
            weights = saveData.array(forKey: "weights") as! [Double]
        }
        let number: Double = NumberFormatter().number(from: label.text!) as! Double
        weights.append(number)
        saveData.set(weights, forKey: "weights")
        
        // 日付
        if saveData.array(forKey: "dates") != nil {
            dates = saveData.array(forKey: "dates") as! [Date]
        }
        dates.append(Date())
        saveData.set(dates, forKey: "dates")
        
        let alert = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }



}
