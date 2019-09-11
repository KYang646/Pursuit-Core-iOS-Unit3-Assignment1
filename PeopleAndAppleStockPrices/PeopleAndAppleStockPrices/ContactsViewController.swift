//
//  ContactsViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var contactsSearchBar: UISearchBar!
    
    var contacts = [InfoWrapper]() {
        didSet {
            contactsTableView.reloadData()
        }
    }
    
    // this reloads the table view every time the search string is updated.
    var searchString: String? {
        didSet {
            contactsTableView.reloadData()
        }
    }
    
    var filteredContacts: [InfoWrapper] {
        guard let searchString1 = searchString else {
            return contacts
            // return everything untouched
        }
        guard searchString1 != "" else {
            return contacts
            // if backspace was hit then it should still return all the data on the tableview
        }
        
        return contacts.filter{$0.name.first.lowercased().contains(searchString1.lowercased())}
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsSearchBar.delegate = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = contactsTableView.indexPathForSelectedRow,
            let ContactsDetailViewController = segue.destination as? ContactsDetailViewController else { fatalError("missing indexPath, ContactsDetailViewController") }
        let user = filteredContacts[indexPath.row]
        ContactsDetailViewController.contacts = user
    }
    
    
    private func loadData() { // this loads the data locally
        
        // pathToJSON is the directory location of the data file
        guard let pathToJSONFile = Bundle.main.path(forResource: "userinfo", ofType: "json") else {
            fatalError("coundn't find json file")}
        
        // this gives us the url using the the local directory file path
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try // it tries to convert what is in the URL into data
                Data(contentsOf: url)
            // we are passing in data to getUsers function
            let userJSON = Contacts.getUsers(fron: data)
            
            // if this function is successful then it returns the decoded data into 'contacts' which is an array of Data from JSON
            contacts = userJSON
        }
        catch {
            print(error)
        }
    }}
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        let userinfoToSet = filteredContacts[indexPath.row]
        //cell.imageView?.image = UIImage(named: userinfoToSet.picture.thumbnail)
        cell.textLabel?.text = userinfoToSet.name.first.capitalized + " " + userinfoToSet.name.last.capitalized
        cell.detailTextLabel?.text = userinfoToSet.location.state.capitalized
        
        return cell
    }
}

extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
        
//        Text.components(separatedBy: "").joined().lowercased()
    }
    
}



