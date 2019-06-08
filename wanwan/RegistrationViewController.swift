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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func save() {
        
        if dognameTextField.text == ""{
            //何も入力されなっかた場合アラートを出す
            let dogalert = UIAlertController(title:"Dog Name", message: "犬の名前を入力してください", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            dogalert.addAction(defaultAction)
            present(dogalert, animated: true, completion: nil)

        }else{
            //その他
            //userDefaultを呼び出し
            let userDefault =  UserDefaults.standard
            // いま保存されているscheduleの配列
            var Dogname = userDefault.array(forKey: "dogname") ?? []
            Dogname.append(dognameTextField.text!)
            userDefault.set(Dogname, forKey: "dogname")
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
        @IBAction func cancel() {
            self.dismiss(animated: true, completion: nil)
        }
        
}

