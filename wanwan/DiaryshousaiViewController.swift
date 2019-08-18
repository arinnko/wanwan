//
//  DiaryshousaiViewController.swift
//  wanwan
//
//  Created by 山本有紗 on 2019/08/12.
//  Copyright © 2019年 山本有紗. All rights reserved.
//

import Foundation
import UIKit
class DiaryshousaiViewController: UIViewController {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var taityouLabel: UILabel!
    @IBOutlet var gohanLabel: UILabel!
    @IBOutlet var sanpoLabel: UILabel!
    @IBOutlet var memoLabel: UILabel!
    
    var selectedIndex: Int?
    
    var diaryArray = [[String: String]] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveData: UserDefaults = UserDefaults.standard
        diaryArray = saveData.object(forKey: "diarys") as! [[String : String]]
        
        dateLabel?.text = diaryArray[selectedIndex!]["date"]
        taityouLabel?.text = diaryArray[selectedIndex!]["taityou"]
        gohanLabel?.text = diaryArray[selectedIndex!]["gohan"]
        sanpoLabel?.text = diaryArray[selectedIndex!]["sanpo"]
        memoLabel?.text = diaryArray[selectedIndex!]["memo"]
        
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
