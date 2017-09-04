//
//  SelectSong.swift
//  Playlist
//
//  Created by Minooc Choo on 9/3/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class SelectSongVC: UIViewController {
    

    @IBOutlet weak var songTitle: UINavigationItem!
    @IBOutlet weak var selectedSongHTML: UIWebView!
    var songTitleForSegue: String!
    var selectedSong: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitle.title = songTitleForSegue
        
        let selectedSongURL = URL(string: selectedSong)
        selectedSongHTML.loadRequest( URLRequest(url: selectedSongURL!))
       
    }
}
