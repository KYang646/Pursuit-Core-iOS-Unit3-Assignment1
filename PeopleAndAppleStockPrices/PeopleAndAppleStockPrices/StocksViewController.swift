//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController{
    
    // MARK: Outlets
    
    @IBOutlet weak var stocksTableView: UITableView!
    
    
    
    
    // MARK: Properties
    var stockMatrix = [[ApplStockInfo]]() {
        didSet{
            stocksTableView.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        setUp()
        stocksTableView.dataSource = self
        stocksTableView.delegate = self
    }
    
    // MARK: Helper Methods
    private func setUp() {
        stockMatrix = ApplStockInfo.returnStockMatrix()
    }
    
}
// MARK: tableView DataSource Methods
extension StocksViewController: UITableViewDataSource {
    func tableView(_ stocksTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
//extension StocksViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextVC = DetailStocksViewController()
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.currentStockInfo = stockMatrix[indexPath.section][indexPath.row]
//        navigationController?.pushViewController(nextVC, animated: true)
//        //present(nextVC, animated: true, completion: nil)
//    }
//}

// MARK:

extension StocksViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = stocksTableView.indexPathForSelectedRow,
            let sDVC = segue.destination as? DetailStocksViewController else { fatalError("missing indexPath, ContactsDetailViewController") }
        
        let stockDetail = stockMatrix[indexPath.section][indexPath.row]
        sDVC.currentStockInfo = stockDetail
    }
}
