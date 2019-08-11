//
//  CustomTableViewCell.swift
//  
//
//  Created by 山本有紗 on 2019/08/11.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var taityoubel: UILabel!
    @IBOutlet weak var gohanlabel: UILabel!
    @IBOutlet weak var sanpolabel: UILabel!
    var diaryArray = [[String: String]] ()
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryArray.count
    }
    //cellの値
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(titleText: String, descriptionText: String) {
        datelabel.text = titleText
        taityoubel.text = descriptionText
        
    }

}
