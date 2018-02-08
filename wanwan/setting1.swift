//
//  setting1.swift
//  
//
//  Created by 山本有紗 on 2018/02/08.
//

import UIKit

class Setting1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    // 選択肢
    let dataList = ["◎", "○", "△", "×"]
    @IBOutlet var textView: UITextField!
    @IBOutlet var textView2: UITextView!
    @IBOutlet var appetitePicker: UIPickerView!
    @IBOutlet var conditionPicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appetitePicker.dataSource = self
        conditionPicker.dataSource = self
        
        appetitePicker.delegate = self
        conditionPicker.delegate = self
        
        appetitePicker.selectedRow(inComponent: 1)
        conditionPicker.selectedRow(inComponent: 1)
        
        
    
        // ピッカーさん
//        //let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
//        picker.center = self.view.center
//
//        // はじめに表示するやつ
//        picker.selectRow(1, inComponent: 0, animated: true)

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "ありんこ"
    }

    
    

}
