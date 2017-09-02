//
//  PlayListVC.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class AddListVC: UIViewController {
    
    @IBOutlet weak var videoView: UIWebView!
    var selectedVideo: String!
    
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
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
}
