//
//  GraphViewController.swift
//  wanwan
//
//  Created by 山本有紗 on 2017/10/26.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit
import ScrollableGraphView

class GraphViewController: UIViewController, UICollectionViewDataSource, UITextFieldDelegate {
    
    var  saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var collectionView:UICollectionView!
    var weights: [Double] = []
    var dates: [Date] = []
    
    @IBOutlet var graphBaseView:UIView! {
        didSet {
            makeSmoothDark()
            
//            let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
//            let referenceLines = ReferenceLines()
//            
//            graphView.addPlot(plot: linePlot)
//            graphView.addReferenceLines(referenceLines: referenceLines)
//            graphView.shouldAdaptRange = true
        }
    }
    
    @IBAction func backToTop(segue: UIStoryboardSegue) {}
    @IBAction func save(segue: UIStoryboardSegue) {}


    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        
        
//        graphView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        if saveData.array(forKey: "weights") != nil {
            weights = saveData.array(forKey: "weights") as! [Double]
        }
        if saveData.array(forKey: "dates") != nil {
            dates = saveData.array(forKey: "dates") as! [Date]
        }
        
//        makeDefalutGraph()
        makeSmoothDark()
//        graphView.reload()
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
    
//    func makeDefalutGraph() {
//
////        graphView = ScrollableGraphView(frame: graphView.frame, dataSource: self)
//
//        let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
//        let referenceLines = ReferenceLines()
//
//        graphView.addPlot(plot: linePlot)
//        graphView.addReferenceLines(referenceLines: referenceLines)
//        graphView.shouldAdaptRange = true
//
//    }
    
    
    func makeSmoothDark(){
        graphBaseView.subviews.forEach({$0.removeFromSuperview()})
        
        let graphView = ScrollableGraphView(frame: self.graphBaseView.frame, dataSource: self)
        
        // Setup the line plot.
        let linePlot = LinePlot(identifier: "darkLine")
        
        linePlot.lineWidth = 1
        linePlot.lineColor = UIColor(red: 230.0/255.0, green: 115.0/255.0, blue: 155.0/255.0, alpha: 0.0)
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
        referenceLines.referenceLineColor = UIColor(red: 255.0/255, green: 0.0/255, blue: 100.0/255, alpha: 0.5).withAlphaComponent(0.2)
        referenceLines.referenceLineLabelColor = UIColor(red: 255.0/255, green: 0.0/255, blue: 100.0/255, alpha: 0.5)
        
        referenceLines.positionType = .absolute
        // Reference lines will be shown at these values on the y-axis.
        referenceLines.absolutePositions = [10, 20, 25, 30] ;
        referenceLines.includeMinMax = false
        
        referenceLines.dataPointLabelColor = UIColor(red: 255.0/255, green: 0.0/255, blue: 100.0/255, alpha: 0.5).withAlphaComponent(0.5)
        
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
        
        graphBaseView.addSubview(graphView)
        
        let leading = graphView.leadingAnchor.constraint(equalTo: self.graphBaseView.leadingAnchor)
        let trailing = graphView.trailingAnchor.constraint(equalTo: self.graphBaseView.trailingAnchor)
        let top = graphView.topAnchor.constraint(equalTo: self.graphBaseView.topAnchor)
        let bottom = graphView.bottomAnchor.constraint(equalTo: self.graphBaseView.bottomAnchor)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
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
        
        return weights[pointIndex]
    }
    
    func label(atIndex pointIndex: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "MM/dd"
        
        return dateFormatter.string(from: dates[pointIndex])
        
    }
    
    func numberOfPoints() -> Int {
        return weights.count
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


