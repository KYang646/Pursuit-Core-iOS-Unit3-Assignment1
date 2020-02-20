//
//  StocksTableViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 2/20/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class StockInfoViewController: UIViewController{
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var stockMatrix = [[ApplStockInfo]]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        setUp()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: Helper Methods
    private func setUp() {
        stockMatrix = ApplStockInfo.returnStockMatrix()
    }
    
}
// MARK: tableView DataSource Methods
extension StockInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockMatrix[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockMatrix.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        xCell.textLabel?.text = ApplStockInfo.makeMeAStringFromDateWithDay(using: ApplStockInfo.makeMeADate(using: stockMatrix[indexPath.section][indexPath.row].date))
        xCell.detailTextLabel?.text = String(stockMatrix[indexPath.section][indexPath.row].open)
        return xCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(ApplStockInfo.makeMeAStringFromDate(using: ApplStockInfo.makeMeADate(using: stockMatrix[section].first!.date))):  Average $\(String(format: "%.2f", ApplStockInfo.calculateAverage(of: stockMatrix[section])))"
    }
}

// MARK: tableView Delegate Methods
extension StockInfoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedStocksVC = newStoryboard.instantiateViewController(withIdentifier: "detailApplStockInfoVC") as? DetailStocksViewController else {
            fatalError("Could not create an instance of View Controller")
        }
        detailedStocksVC.currentStockInfo = stockMatrix[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailedStocksVC, animated: true)
    }
}
