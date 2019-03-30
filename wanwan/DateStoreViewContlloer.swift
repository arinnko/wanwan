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
    var linePlotData: [Double] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func saveButton() {
        if saveData.array(forKey: "Data") != nil {
            linePlotData = saveData.array(forKey: "Data") as! [Double]
        }
        var number: Double = NumberFormatter().number(from: dataTextField.text!) as! Double
        linePlotData.append(number)
        saveData.set(linePlotData, forKey: "Data")
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存されました", preferredStyle: .alert)
    }
    @IBAction func cancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
}


