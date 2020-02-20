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
        guard let curUser = currentUser else {
            print("Could not obtain an instance of user")
            return
        }

        nameLabel.text = "Name: \(contacts.name.first.capitalized)" + " " + "\(contacts.name.last.capitalized)"
        emailLabel.text = "Email: \(contacts.email)"
        emailLabel.text = "Date of Birth: \(UserInfo.displayDate(date: contacts.dob.components(separatedBy: " ").first!))"

    }
    



}
