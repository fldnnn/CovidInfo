//
//  DetailRecoveredViewController.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import UIKit
import Charts

class DetailRecoveredViewController: UIViewController {
    
    var country: Country?
    var detailRecoveredPresenterObject: ViewToPresenterDetailRecoveredProcotol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailRecoveredRouter.createModule(ref: self)
        setupUI()

        if let c = country {
            detailRecoveredPresenterObject?.viewDidLoad(with: c)
        }
    }
    
    private func createChartRecovered(with recoveredData: [DataProvide]) {
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        var entries = [BarChartDataEntry]()
        var date = [String]()
        var count = 0
        
        for detail in recoveredData {
            date.append(detail.year_stamp!)
            count += 1
            entries.append(BarChartDataEntry(x: Double(count - 1), y: Double(detail.cnt_recovered!)))
        }

        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
        
        let set = BarChartDataSet(entries: entries, label: "Recovered")
        let data = BarChartData(dataSet: set)
        set.colors = [NSUIColor(ciColor: .init(red: 0.21, green: 0.71, blue: 0.52))]
       
        barChart.data = data
        barChart.center = view.center
        
        view.addSubview(barChart)
    }
    
    private func setupUI() {
        //TabBar
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBarController?.tabBar.frame.size.height = 50
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        //NavigationBar
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    private func changeColor(itemAppearance: UITabBarItemAppearance) {
        itemAppearance.selected.iconColor = .black
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
    }
}

extension DetailRecoveredViewController: PresenterToViewDetailRecoveredProcotol {
    func updateView(with recoveredData: [DataProvide]) {
        createChartRecovered(with: recoveredData)
    }
}
