//
//  PlaylistVC.swift
//  Playlist
//
//  Created by Minooc Choo on 9/3/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit


class PlaylistVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var playlistLbl: UINavigationItem!
    @IBOutlet weak var songListTable: UITableView!
    
    var songList = [Youtube]()
    var playlistTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistLbl.title = playlistTitle
        
        songListTable.delegate = self
        songListTable.dataSource = self
        
    }
    
    @IBAction func doneBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "selectedSong") {
            
            
            let selectSongVC = segue.destination as? SelectSongVC
            let senderAsYoutube = songList[((sender as? IndexPath)?.row)!]
            
            selectSongVC?.songTitleForSegue = senderAsYoutube._title
            let videoURL = "https://www.youtube.com/embed/" + ((senderAsYoutube as? Youtube)?._id)!
            selectSongVC?.selectedSong = videoURL
            
            /*
             let videoURL = "https://www.youtube.com/embed/" + ((sender as? YoutubeVideo)?._id)!
             addThisVideoVC?.selectedVideo = videoURL
             */
            
        }
    }
    
    /******************* Table View *****************/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // need 1 section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songListCell", for: indexPath) as? SongListCell {
            
            let songObject = songList[indexPath.row]
            cell.configureCell(ytSong: songObject)
            
            return cell
        } else {
            return SongListCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "selectedSong", sender: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
