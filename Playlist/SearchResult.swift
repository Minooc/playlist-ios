//
//  SearchResult.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class SearchResult: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func configureCell(ytObject: YoutubeVideo) {
        title.text = ytObject._title
        
        let url = URL(string: ytObject._thumbUrl)
        let data = try? Data(contentsOf: url!)
        thumbnail.image = UIImage(data: data!)
        
    }

}
