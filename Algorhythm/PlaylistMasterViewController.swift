//
//  ViewController.swift
//  Algorhythm
//
//  Created by Scott Taylor on 26/04/2015.
//  Copyright (c) 2015 Carnaby Labs. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {
   
    var playlistsArray: [UIImageView] = []
    @IBOutlet weak var playlistImageView0: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistsArray.append(playlistImageView0)
        
        for index in 0..<playlistsArray.count {
            let playlist = Playlist(index: index)
            let playlistImageView = playlistsArray[index]
            
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" {
            
            let playlistImageView = sender!.view as! UIImageView
            if let index = find(playlistsArray, playlistImageView) {
                let playlistDetailController = segue.destinationViewController as! PlaylistDetailViewController
                playlistDetailController.playlist = Playlist(index: index)
            }
        }
    }
    
    @IBAction func showPlaylistDetail(sender: AnyObject) {
        
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
        
    }
    
    
}
