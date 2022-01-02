//
//  ViewController.swift
//  MyGraphs
//
//  Created by 橋本純一 on 2022/01/02.
//

import Charts
import UIKit

// ライブラリーを読み込む必要がある
class ViewController: UIViewController, ChartViewDelegate {
    
    // 棒グラフを作成
    var barChart = BarChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
    }
    
    // 棒グラフのサブビューを作る
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        barChart.center = view.center
        
        // 追加して保存
        view.addSubview(barChart)
        
        var entris = [BarChartDataEntry]()
        
        for x in 0..<10 {
            entris.append(BarChartDataEntry(x: Double(x), // Double型にしないとエラー出る
                                            y: Double(x))) // Double型にしないとエラー出る
        }
        
        // 棒グラフのデータと等しい値を設定します
        let set = BarChartDataSet(entries: entris)
        // カラフルな棒グラフが得られる
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }


}

