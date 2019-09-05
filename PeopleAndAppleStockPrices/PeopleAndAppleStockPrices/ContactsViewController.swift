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
    var contacts = [ListInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        loadData()
    }
    
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "userinfo", ofType: "json") else {
            fatalError("coundn't find json file")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try
                Data(contentsOf: url)
            let userJSON = try Contacts.getUsers(fron: data)
            contacts = userJSON
        }
        catch {
            print(error)
        }
    }}
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        let userinfoToSet = contacts[indexPath.row]
        //cell.imageView?.image = UIImage(named: userinfoToSet.picture.thumbnail)
        cell.textLabel?.text = userinfoToSet.name.first.capitalized.sorted() + " " + userinfoToSet.name.last.capitalized
        cell.detailTextLabel?.text = userinfoToSet.location.state.capitalized
        
        return cell
    }
}


//
//    extension ViewController: UISearchBarDelegate{
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.resignFirstResponder()
//            guard let searchText = searchBar.text else {return}
//            userInfo = userInfo.filter{($0.name.first + " " + $0.name.last).contains(searchText.lowercased()) || $0.name.first.contains(searchText.lowercased()) || $0.name.last.contains(searchText.lowercased())}
//        }
//    }


