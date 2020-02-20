//
//  DetailedStocksTableViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 2/20/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class DetailStocksViewController: UIViewController{
    
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var openPriceLabel: UILabel!
    @IBOutlet weak var closePriceLabel: UILabel!
    
    // MARK: Properties
    var currentStockInfo: ApplStockInfo?
    
    // MARK: Lifecycle Methods
    override func viewDidLoad(){
        setUp()
        super.viewDidLoad()
    }
    
    // MARK: Helper Methods
    private func setUp(){
        guard let unwrappedStockInfo = currentStockInfo else {
            return
        }
        dateLabel.text = ApplStockInfo.makeMeAStringFromDateWithDay(using: ApplStockInfo.makeMeADate(using: unwrappedStockInfo.date))
        openPriceLabel.text = "Open: \(String(format: "%.2f", unwrappedStockInfo.open))"
        closePriceLabel.text = "Close: \(String(format: "%.2f", unwrappedStockInfo.close))"
        
        if unwrappedStockInfo.didMarketProfit(){
            imageView.image = UIImage(named: "thumbsUp")
            view.backgroundColor = .green
        } else {
            imageView.image = UIImage(named:"thumbsDown")
            view.backgroundColor = .red
        }
    }
}
