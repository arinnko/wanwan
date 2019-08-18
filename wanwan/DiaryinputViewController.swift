//
//  DailyinputViewController.swift
//  FSCalendar
//
//  Created by 山本有紗 on 2019/08/09.
//

import Foundation
import UIKit

class DailyinputViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var taityouslider: UISlider!
    @IBOutlet var gohanslider: UISlider!
    @IBOutlet var sanposlider: UISlider!
    @IBOutlet var memotextfield: UITextField!
    @IBOutlet var taityoulabel: UILabel!
    @IBOutlet var gohanlabel: UILabel!
    @IBOutlet var sanpolabel: UILabel!
    @IBOutlet weak var dateField: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ピッカー設定
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateField.inputView = datePicker
        
        // 決定バー
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        dateField.inputView = datePicker
        dateField.inputAccessoryView = toolbar

    
    }
    
    // UIDatePickerのDone
    @objc func done() {
        dateField.endEditing(true)
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        dateField.text = "\(formatter.string(from: datePicker.date))"

    }
        
        
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save() {
        let userDefault =  UserDefaults.standard
        var diarys = userDefault.array(forKey: "diarys") ?? []
        
        let diary = [
            "memo": memotextfield.text!,
            "taityou": taityoulabel.text!,
            "gohan": gohanlabel.text!,
            "sanpo": sanpolabel.text!,
            "date": dateField.text!
            ] as [String : Any]
        
        diarys.append(diary)
        //値をset
        userDefault.set(diarys, forKey: "diarys")
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    //sliderが動いた時に呼ばれる
    @IBAction func taityousliderChanged(_ sender: UISlider) {
        if sender.value < 0.33 {
            taityoulabel.text = "😣"
        } else if sender.value < 0.66 {
            taityoulabel.text = "🙂"
        } else {
            taityoulabel.text = "😃"
        }
        print(sender.value)
    }
    
    @IBAction func gohansliderChanged(_ sender: UISlider) {
        if sender.value < 0.33 {
            gohanlabel.text = "😣"
        } else if sender.value < 0.66 {
            gohanlabel.text = "🙂"
        } else {
            gohanlabel.text = "😃"
        }
    }
    @IBAction func sanposliderChanged(_ sender: UISlider) {
        if sender.value < 0.33 {
            sanpolabel.text = "😣"
        } else if sender.value < 0.66 {
            sanpolabel.text = "🙂"
        } else {
            sanpolabel.text = "😃"
        }
    }
}

