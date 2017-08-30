//
//  SearchVC.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit
import Alamofire

typealias DownloadComplete = () -> ()

class SearchVC: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var searchBarTop: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    var _searchBarText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarTop.showsCancelButton = false
        searchBarTop.delegate = self
        
        searchBarTop.layer.borderWidth = 1
        searchBarTop.layer.borderColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0).cgColor
        
        searchTable.delegate = self
        searchTable.dataSource = self
        

    }
    
    func searchBarText() -> String {
        if (_searchBarText == nil) {
            _searchBarText = ""
        }
        return _searchBarText
    }
    
    /******************* Search Bar *****************/
    
    func updateSearchResults(for searchController: UISearchController) {
        // TO DO

    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarTop.showsCancelButton = true

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        _searchBarText = searchBarTop.text
        downloadSearch {
            
        }
    }
    

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBarTop.showsCancelButton = false

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        _searchBarText = searchBarTop.text
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
    
    
    /* Search */
    
    func downloadSearch(completed: @escaping DownloadComplete) {
        let url = BASE_URL + PART_SNIPPET + QUERYEQUAL + "\(self._searchBarText as String)" + KEY
        Alamofire.request( url).responseJSON { response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                print(dict)
            }
            completed()
        }
    }


}

