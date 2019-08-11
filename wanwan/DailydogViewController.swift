//
//  DailydogViewController.swift
//  wanwan
//
//  Created by 山本有紗 on 2019/08/10.
//  Copyright © 2019年 山本有紗. All rights reserved.
//

import Foundation
import UIKit

class DailydogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var dailytableview: UITableView!
    var diaryArray = [[String: String]] ()
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryArray.count
    }
    //cellの値
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell", for: indexPath) as! DiaryTableViewCell
        cell.dateLabel.text = "あああ"
        //cellにscheduleArrayを表示する
        //cell.textLabel?.text = diaryArray[indexPath.row]["memo"]
        
        return cell
    }
    
    //cellが選択された時
    func dailytableview(dailytableview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セルの内容：(diary[indexPath.row])")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailytableview.dataSource = self
        dailytableview.register(UINib(nibName: "DiaryTableViewCell", bundle: nil),forCellReuseIdentifier:"DiaryTableViewCell")
        let saveData: UserDefaults = UserDefaults.standard
        let diary = saveData.array(forKey: "diarys") as? [[String: String]] ?? []
        self.diaryArray = diary
    }
    
    
    
}

