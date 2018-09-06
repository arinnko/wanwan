//
//  GraphViewController.swift
//  wanwan
//
//  Created by 山本有紗 on 2017/10/26.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit
import ScrollableGraphView

class GraphViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView:UICollectionView!
     var linePlotData = [10.0, 20.0, 43.0, 74.0, 5.0, 82.0]
    
    @IBOutlet var graphView:ScrollableGraphView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        collectionView.dataSource = self
//        // UIImage インスタンスの生成
//        let image:UIImage = UIImage(named:"chiko1.jpg")!
//
//        // UIImageView 初期化
//        let imageView = UIImageView(image:image)
//
//        // 画面の横幅を取得
//        let screenWidth:CGFloat = view.frame.size.width/2
//        let screenHeight:CGFloat = view.frame.size.height/2
//
//        // 画像の幅・高さの取得
//        let imgWidth = image.size.width
//        let imgHeight = image.size.height
//
//        // 画像サイズをスクリーン幅に合わせる
//        let scale = screenWidth / imgWidth * 0.9
//        let rect:CGRect = CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
//
//        // ImageView frame をCGRectで作った矩形に合わせる
//        imageView.frame = rect;
//
//        // 画像の中心を画面の中心に設定
//        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
//
//        // 角丸にする
//        imageView.layer.cornerRadius = imageView.frame.size.width * 0.1
//        imageView.clipsToBounds = true
//
//        // UIImageViewのインスタンスをビューに追加
//        self.view.addSubview(imageView)
//
//        //　画像をさらに５０％丸くする
//        imageView.layer.cornerRadius = imageView.frame.size.width * 0.5
//
        
       
        makeSmoothDark()
//        makeDefalutGraph()
        graphView.dataSource = self
       
        

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
    
    func makeDefalutGraph() {
        
        graphView = ScrollableGraphView(frame: graphView.frame, dataSource: self)
        
        let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
        let referenceLines = ReferenceLines()
        
        graphView.addPlot(plot: linePlot)
        graphView.addReferenceLines(referenceLines: referenceLines)
        graphView.shouldAdaptRange = true
        
    }
    
    
    func makeSmoothDark(){
//        self.graphView = ScrollableGraphView(frame: graphView.frame, dataSource: self)
        
        // Setup the line plot.
        let linePlot = LinePlot(identifier: "darkLine")
        
        linePlot.lineWidth = 1
        linePlot.lineColor = UIColor.cyan//.init(hexString: "darkLine")//.colorFromHex(hexString: "darkLine")
        linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        linePlot.shouldFill = true
        linePlot.fillType = ScrollableGraphViewFillType.gradient
        linePlot.fillGradientType = ScrollableGraphViewGradientType.linear
        linePlot.fillGradientStartColor = UIColor.white//init(hexString: "#555555")//colorFromHex(hexString: "#555555")
        linePlot.fillGradientEndColor = UIColor.init(red: 255.0/255, green: 0.0/255, blue: 50.0/255, alpha: 0.0)//.init(hexString: "#444444")//colorFromHex(hexString: "#444444")
        
        linePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        let dotPlot = DotPlot(identifier: "darkLineDot") // Add dots as well.
        dotPlot.dataPointSize = 4
        dotPlot.dataPointFillColor = UIColor.init(red: 255.0/255, green: 0.0/255, blue: 100.0/255, alpha: 0.5)
        
        dotPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        // Setup the reference lines.
        let referenceLines = ReferenceLines()
        
        referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        referenceLines.referenceLineColor = UIColor.white.withAlphaComponent(0.2)   
        referenceLines.referenceLineLabelColor = UIColor.white
        
        referenceLines.positionType = .absolute
        // Reference lines will be shown at these values on the y-axis.
        referenceLines.absolutePositions = [10, 20, 25, 30]
        referenceLines.includeMinMax = false
        
        referenceLines.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        // Setup the graph
        graphView.backgroundFillColor = UIColor.clear//.init(hex: "#FFC0CB")
        //.init(red: 218.0/255.0, green: 255/255, blue: 192/255, alpha: 1.0)//.init(hexString: "#333333")//colorFromHex(hexString: "#333333")
        graphView.dataPointSpacing = 80
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.shouldRangeAlwaysStartAtZero = true
        
        graphView.rangeMax = 50
        
        // Add everything to the graph.
        graphView.addReferenceLines(referenceLines: referenceLines)
        graphView.addPlot(plot: linePlot)
        graphView.addPlot(plot: dotPlot)
        
      
    }
    
    
}

extension GraphViewController: ScrollableGraphViewDataSource {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        //        switch(plot.identifier) {
        //        case "line":
        //            return linePlotData[pointIndex]
        //        default:
        //            return 0
        //        }
        
        return linePlotData[pointIndex]
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
        return linePlotData.count
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


