//
//  File.swift
//  wanwan
//
//  Created by 山本有紗 on 2018/08/25.
//  Copyright © 2018年 山本有紗. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var dognameTextField: UITextField!
    @IBOutlet weak var Femalebutton: UIButton!
    @IBOutlet weak var Malelebutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func save() {
        //userDefaultを呼び出し
        let userDefault =  UserDefaults.standard
        // いま保存されているscheduleの配列
        var Dogname = userDefault.array(forKey: "dogname") ?? []
        Dogname.append(dognameTextField.text!)
        userDefault.set(Dogname, forKey: "dogname")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

