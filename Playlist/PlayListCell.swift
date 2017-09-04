//
//  PlayListCell.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class PlayListCell: UITableViewCell {

    @IBOutlet weak var playlistLbl: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    func configureCell(plObject: Playlist) {
        
        if (playlistLbl?.text == nil) {
            playlistLbl?.text = ""
        }
        
        playlistLbl?.text = plObject._title 
        
    }

    func configureImage(plObject: Playlist) {
        
        if !(plObject._songs.isEmpty) {

            let firstSongThumbUrl: String = plObject._songs[0]._thumbUrl!
            
            let url = URL(string: firstSongThumbUrl)
            
            let data = try? Data(contentsOf: url!)
            
            if (data != nil) {
                thumbnail.image = UIImage(data: data!)
            }
            

        }
    }
}
