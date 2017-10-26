//
//  DesignClass.swift
//  wanwan
//
//  Created by 山本有紗 on 2017/10/26.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    @IBInspectable var borderColor :  UIColor = UIColor.black
    @IBInspectable var borderWidth :  CGFloat = 0.1
    @IBInspectable var cornerRadius :  CGFloat = 5.0
    
    
    override var image: UIImage? {
        didSet{
            layer.masksToBounds = false
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
            layer.cornerRadius = frame.height/2
            clipsToBounds = true
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
//
//    @IBInspectable var borderColor:UIColor = UIColor.white {
//        did
//    }
    
}
