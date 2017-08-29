//
//  SearchVC.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var searchBarTop: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarTop.showsCancelButton = false
        searchBarTop.delegate = self
        
        searchBarTop.layer.borderWidth = 1
        searchBarTop.layer.borderColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0).cgColor
        
        searchTable.delegate = self
        searchTable.dataSource = self
    }
    
    /******************* Search Bar *****************/
    
    func updateSearchResults(for searchController: UISearchController) {
        // TO DO
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarTop.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBarTop.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarTop.text = ""
        searchBarTop.showsCancelButton = false
        searchBarTop.endEditing(true)
    }
    
    /******************* Table View *****************/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // need 1 section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as? SearchResult {
            return cell
        } else {
            return SearchResult()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }


}

