



//
//  setting1.swift
//  
//
//  Created by 山本有紗 on 2018/02/08.
//

import UIKit

class Setting1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var textlabel: UILabel!
    
    
    
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
        
    }
    

    
    
    

    
    
    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //コンポーネントごとに現在選択されているデータを取得する。
        let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        
        print(data1)
    }
    
    //コンポーネントの個数を返すメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    

    
    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }

    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    //wwwwwwwwwwwwwwwwwwwww
    
    
    
}
