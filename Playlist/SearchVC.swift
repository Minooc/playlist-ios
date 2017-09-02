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
    private var _title: String!
    private var _songUrl: String!
    private var _thumbnail: AnyObject!
    private var _id: String!
    private var searchList: [Youtube] = []

    
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
    
    @IBAction func addBtnPressed(_ sender: Any) {
    
        let tagNumber = (sender as AnyObject).tag
        
        if (tagNumber != nil) {
            let thisSong = searchList[tagNumber!]
            performSegue(withIdentifier: "AddThisSong", sender: thisSong)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddThisSong") {
            let addThisSongVC = segue.destination as? AddListVC
            
           /* let videoHTML = "<iframe width=\"373\" height=\"210\" src=\"https://www.youtube.com/embed/" + ((sender as? YoutubeVideo)?._id)! + "\"frameborder=\"0\" allowfullscreen></iframe>"
            addThisVideoVC?.selectedVideo = videoHTML
             */

            /*
            let videoURL = "https://www.youtube.com/embed/" + ((sender as? YoutubeVideo)?._id)!
            addThisVideoVC?.selectedVideo = videoURL
            */
            
            
        }
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
        searchList = []
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
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as? SearchResult {
            
            let ytObject = searchList[indexPath.row]
            cell.configureCell(ytObject: ytObject)
            cell.addBtn.tag = indexPath.row     // set tag number to add button
            
            
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
        let url = BASE_URL + PART_SNIPPET + MAX_RESULT + QUERYEQUAL +  "\(self._searchBarText as String)" + KEY
        print(url)
        Alamofire.request( url).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                let items = dict["items"] as? [Dictionary<String, AnyObject>]
                
                if items != nil {
                
                    for item in items! {
                    
                        let thisSong = Youtube()
                        var isYouTube = true
                    
                        let snippet = item["snippet"] as? Dictionary<String, AnyObject>
                    
                        if let title = snippet?["title"] as? String {
                            self._title = title
                        }
                    
                
                        let thumbList = snippet?["thumbnails"] as AnyObject
                    
                        if let thumb = thumbList["default"] as? AnyObject {
                            self._thumbnail = thumb
                        }
                    
                
                        if let id = item["id"] as? Dictionary<String, String> {

                            let songId = id["videoId"]
                            
                            if songId == nil {
                                isYouTube = false
                            } else {
                                self._id = songId
                                let songUrl = "https://www.youtube.com/embed/" + songId!
                                self._songUrl =  songUrl
                            }
                        }
                    
                        if isYouTube == true {
                            thisSong.configure(title: self._title, thumbnail: self._thumbnail as! Dictionary<String, AnyObject>, url: self._songUrl, id: self._id)
                            self.searchList.append(thisSong)
                        }
                        
                    }
                    
             
                }
                
                self.searchTable.reloadData()
                
            }
            completed()
        }
    }


}

