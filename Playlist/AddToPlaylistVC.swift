//
//  AddToPlaylistVC.swift
//  Playlist
//
//  Created by Minooc Choo on 9/3/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class AddToPlaylistVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playlistTable: UITableView!
    var playlist = Playlist()
    var playlists = [Playlist]()
    var songToAdd = Youtube()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistTable.delegate = self
        playlistTable.dataSource = self
        
       // print(globalPlaylists.count)
        self.playlists = globalPlaylists
        
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
            
            return cell
        } else {
            return PlayListCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playlists[indexPath.row].addSong(songTitle: songToAdd)
        
        globalPlaylists = self.playlists
        
        //print("Now this playlist has \(playlists[indexPath.row]._songs.count) songs")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}
