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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
