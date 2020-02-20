//
//  ContactsDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 9/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    
    var contacts: InfoWrapper!
   // var userInformation: InfoWrapper!
    // let results: [ListInfo]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    private func setUp(){
        guard let selectedUser = contacts else {
            print("Could not obtain an instance of user")
            return
        }

        nameLabel.text = "Name: \(selectedUser.name.first.capitalized)" + " " + "\(selectedUser.name.last.capitalized)"
        emailLabel.text = "Email: \(selectedUser.email)"
        cityLabel.text = "City: \(selectedUser.location.city)"

    }
    



}
