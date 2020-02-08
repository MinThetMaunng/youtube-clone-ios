//
//  TrendingCell.swift
//  YouTube
//
//  Created by Min Thet Maung on 04/02/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingVideos { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
