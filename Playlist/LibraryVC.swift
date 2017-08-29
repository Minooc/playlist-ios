//
//  LibraryVC.swift
//  Playlist
//
//  Created by Minooc Choo on 8/28/17.
//  Copyright © 2017 Minooc Choo. All rights reserved.
//

import UIKit

class LibraryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var libraryTable: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryTable.delegate = self
        libraryTable.dataSource = self
        
    }
    
    @IBAction func addPLBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddList", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddList") {
            let addListVC = segue.destination as? AddListVC
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // need 1 section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "playListCell", for: indexPath) as? PlayListCell {
            return cell
        } else {
            return PlayListCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
}
