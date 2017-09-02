//
//  Song.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import Foundation
import UIKit

class Youtube {
    
    var _title: String!
    var _url: String!
    var _id: String!
    var _thumbWidth: Int!
    var _thumbHeight: Int!
    var _thumbUrl: String!
    
    init() {}
    
    func configure(title: String, thumbnail: Dictionary<String, AnyObject>, url: String, id: String) {
        self._url = url
        self._title = title
        self._id = id
        
        self._thumbWidth = thumbnail["width"] as! Int
        self._thumbHeight = thumbnail["height"] as! Int
        self._thumbUrl = thumbnail["url"] as! String
    }
    
    func printVar() {
        print(_title, _thumbWidth, _thumbHeight, _thumbUrl, _url)
    }
    
}
