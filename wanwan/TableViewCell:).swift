//
//  TableViewCell:).swift
//  wanwan
//
//  Created by 山本有紗 on 2019/08/11.
//  Copyright © 2019年 山本有紗. All rights reserved.
//

import UIKit

class TableViewCell__: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    self.TableViewCell.contentInset = UIEdgeInsetsMake(10.0f, 20.0f, 30.0f, 40.0f);

}
