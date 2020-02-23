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
        setUp()
        
    }
    
    
    private func setUp(){
        guard let selectedUser = contacts else {
            print("Could not obtain an instance of user")
            return
        }

        nameLabel.text = "\(selectedUser.name.first.capitalized)" + " " + "\(selectedUser.name.last.capitalized)"
        emailLabel.text = selectedUser.email
        cityLabel.text = selectedUser.location.city

    }
    



}
