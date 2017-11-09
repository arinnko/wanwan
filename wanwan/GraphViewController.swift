//
//  GraphViewController.swift
//  wanwan
//
//  Created by 山本有紗 on 2017/10/26.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView:UICollectionView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.dataSource = self
        // UIImage インスタンスの生成
        let image:UIImage = UIImage(named:"chiko1.jpg")!
        
        // UIImageView 初期化
        let imageView = UIImageView(image:image)
        
        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width/2
        let screenHeight:CGFloat = view.frame.size.height/2
        
        // 画像の幅・高さの取得
        let imgWidth = image.size.width
        let imgHeight = image.size.height
        
        // 画像サイズをスクリーン幅に合わせる
        let scale = screenWidth / imgWidth * 0.9
        let rect:CGRect = CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // 角丸にする
        imageView.layer.cornerRadius = imageView.frame.size.width * 0.1
        imageView.clipsToBounds = true
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
        
        //　画像をさらに５０％丸くする
        imageView.layer.cornerRadius = imageView.frame.size.width * 0.5

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//         let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TestCell", forIndexPath: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wanwanCell", for: indexPath)
        return cell
    }
    
    
}
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


