//
//  PlayListVC.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

protocol AddListVCDelegate {
    func dataChanged(playlists: [Playlist])
}

class AddListVC: UIViewController {
    
    var delegate: AddListVCDelegate?
    
    var selectedVideo: String!
    var playlist = Playlist()
    var playlists = [Playlist]()
    
    @IBOutlet weak var playlistTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        if (selectedVideo != nil) {
            let selectedVideoURL : URL = URL(string: selectedVideo)!
            let urlRequest : URLRequest = URLRequest(url: selectedVideoURL)
            //videoView.loadHTMLString(selectedVideo, baseURL: nil)
            videoView.loadRequest(urlRequest)
        }
         */
        

    }
    
    @IBAction func createPressed(_ sender: Any) {
        if (playlistTxt.text != nil) {
            playlist._title = playlistTxt.text
        }
        /*
        if let libVC = storyboard?.instantiateViewController(withIdentifier: "LibraryVC") as? LibraryVC {
     
            playlists.append(self.playlist)
            libVC.playlists = self.playlists
        }
        */

        playlists.append(self.playlist)
        delegate?.dataChanged(playlists: playlists)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PlaylistCreated") {
            
             let libraryVC = segue.destination as? LibraryVC
             libraryVC?.playlist = self.playlist
             libraryVC?.playlists = self.playlists
             libraryVC?.playlists.append(self.playlist)
        }
 */
}
 
    
    
    
    

