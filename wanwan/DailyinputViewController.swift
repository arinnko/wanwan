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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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

