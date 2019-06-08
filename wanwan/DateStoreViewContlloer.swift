//
//  DateStoreViewContlloer.swift
//  wanwan
//
//  Created by 山本有紗 on 2019/02/07.
//  Copyright © 2019年 山本有紗. All rights reserved.
//

import Foundation
import UIKit

class DateStoreViewController: UIViewController, UITextFieldDelegate {
    //@IBOutlet var dogPicker: UIPickerView!
    @IBOutlet var dataTextField: UITextField!
    var saveData: UserDefaults = UserDefaults.standard
    
    var weights: [Double] = []
    var dates: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func saveButton() {
        // 呼び出し
        if isOnlyNumber(dataTextField.text!) {
            // 体重保存
            if saveData.array(forKey: "weights") != nil {
                weights = saveData.array(forKey: "weights") as! [Double]
            }
            let number: Double = NumberFormatter().number(from: dataTextField.text!) as! Double
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
        } else {
            // 数字のみでない
            let alert = UIAlertController(title: "エラー", message: "数字を入力してください", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
            
    
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 数字のみかを調べる。
    func isOnlyNumber(_ str:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES '\\\\d+'")
        return predicate.evaluate(with: str)
    }
    




}
