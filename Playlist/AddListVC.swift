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
        
        globalPlaylists = self.playlists
        
        

    }
    
    @IBAction func createPressed(_ sender: Any) {
        
        if (playlistTxt.text != nil) {
            playlist._title = playlistTxt.text
        }
        

        playlists.append(self.playlist)
        delegate?.dataChanged(playlists: playlists)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
 
    
    
    
    

