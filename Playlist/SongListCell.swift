//
//  SongListCell.swift
//  Playlist
//
//  Created by Minooc Choo on 9/3/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import Foundation
import UIKit

class SongListCell: UITableViewCell {
    
    @IBOutlet weak var songThumbnail: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    
    func configureCell(ytSong: Youtube) {
        songLabel.text = ytSong._title
        
        let url = URL(string: ytSong._thumbUrl)
        let data = try? Data(contentsOf: url!)
        songThumbnail.image = UIImage(data: data!)
        
    }

}
