//
//  SecondViewController.swift
//  MyGraphs
//
//  Created by 橋本純一 on 2022/01/02.
//
// 折れ線グラフを作成
import Charts
import UIKit

class SecondViewController: UIViewController, ChartViewDelegate {
    
    var lineChart = LineChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        lineChart.center = view.center
        
        // 追加して保存
        view.addSubview(lineChart)
        // グラフとデータにエントリー
        var entris = [ChartDataEntry]()
        
        for x in 0..<10 {
            entris.append(ChartDataEntry(x: Double(x), // Double型にしないとエラー出る
                                            y: Double(x))) // Double型にしないとエラー出る
        }
        
        // 棒グラフのデータと等しい値を設定します
        let set = LineChartDataSet(entries: entris)
        // materialに変更
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }

}
