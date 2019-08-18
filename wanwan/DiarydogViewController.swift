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
        //cellにscheduleArrayを表示する
        cell.dateLabel?.text = diaryArray[indexPath.row]["date"]
        cell.taityouLabel?.text = diaryArray[indexPath.row]["taityou"]
        cell.gohanLabel?.text = diaryArray[indexPath.row]["gohan"]
        cell.sanpoLabel?.text = diaryArray[indexPath.row]["sanpo"]
        return cell
    }
    //cellが選択された時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        // cellの選択を解除
        dailytableview.deselectRow(at: indexPath as IndexPath, animated: true)
        // 画面に遷移
        performSegue(withIdentifier: "segue", sender: indexPath.row)
    }
    
    //cellの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    //cellを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            diaryArray.remove(at: indexPath.row)
            
            //保存
            let userDefault =  UserDefaults.standard
            userDefault.set(diaryArray, forKey: "diarys")
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailytableview.dataSource = self
        dailytableview.delegate = self
        //カスタムセル
        dailytableview.register(UINib(nibName: "DiaryTableViewCell", bundle: nil),forCellReuseIdentifier:"DiaryTableViewCell")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let nextVC = segue.destination as! DiaryshousaiViewController
            nextVC.selectedIndex = sender as? Int
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let saveData: UserDefaults = UserDefaults.standard
        let diary = saveData.array(forKey: "diarys") as? [[String: String]] ?? []
        self.diaryArray = diary
        self.dailytableview.reloadData()
    }
    
    
}

