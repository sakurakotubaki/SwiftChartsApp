//
//  ThirdViewController.swift
//  MyGraphs
//
//  Created by 橋本純一 on 2022/01/02.
//
// 円グラフを作成
import Charts
import UIKit

class ThirdViewController: UIViewController, ChartViewDelegate {
    
    var pieChart = PieChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.center = view.center
        
        // 追加して保存
        view.addSubview(pieChart)
        // グラフとデータにエントリー
        var entris = [ChartDataEntry]()
        
        for x in 0..<10 {
            entris.append(ChartDataEntry(x: Double(x), // Double型にしないとエラー出る
                                            y: Double(x))) // Double型にしないとエラー出る
        }
        
        // 棒グラフのデータと等しい値を設定します
        let set = PieChartDataSet(entries: entris)
        // pastelに変更
        set.colors = ChartColorTemplates.pastel()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
    
}
