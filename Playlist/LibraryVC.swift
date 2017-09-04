//
//  LibraryVC.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class LibraryVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AddListVCDelegate {
    

    @IBOutlet weak var libraryTable: UITableView!
    var playlist = Playlist()
    var playlists = [Playlist]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryTable.delegate = self
        libraryTable.dataSource = self
        
        globalPlaylists = self.playlists
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        libraryTable.reloadData()
    }

    
    
    @IBAction func addPLBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddList", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "AddList") {
            
            let addListVC = segue.destination as? AddListVC
            addListVC?.playlists = self.playlists
            addListVC?.delegate = self
            
        }
        
        if (segue.identifier == "toPlaylist") {
            
            let playlistVC = segue.destination as? PlaylistVC
            playlistVC?.playlistTitle = playlists[((sender as? IndexPath)?.row)!]._title
            playlistVC?.songList = playlists[((sender as? IndexPath)?.row)!]._songs
            playlistVC?.indexRow = (sender as? IndexPath)?.row
        
            
        }
    }
    
    func dataChanged(playlists: [Playlist]) {
        self.playlists = playlists
        globalPlaylists = self.playlists
        libraryTable.reloadData()
    }

    /******************** TABLE *********************/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // need 1 section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "playListCell", for: indexPath) as? PlayListCell {
            
            let plObject = playlists[indexPath.row]
            cell.configureCell(plObject: plObject)
            cell.configureImage(plObject: plObject)
            
            return cell
        } else {
            return PlayListCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            if (tableView.dequeueReusableCell(withIdentifier: "playListCell") as? PlayListCell) != nil {

//                let thisPlaylist = playlists[indexPath.row]
                playlists.remove(at: indexPath.item)
                globalPlaylists = self.playlists
                libraryTable.reloadData()
                
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPlaylist", sender: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
