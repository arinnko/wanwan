//
//  DateStoreViewContlloer.swift
//  wanwan
//
//  Created by 山本有紗 on 2019/02/07.
//  Copyright © 2019年 山本有紗. All rights reserved.
//

import Foundation
class DateStoreViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    @IBOutlet var dogPicker: UIPicker!
    @IBOutlet var dateTextField: UITextField!
    var saveDate: UserDefaults = UserDefaults.standard
    var x: Double = 0.0
    
    
    
    override func viewDidLoard(){
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButton() {
        saveDate.set(dateTextField.text, forKey: "Date")
    }
    @IBAction func cancelButton: UIButton!
}



