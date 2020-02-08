//
//  SubscriptionCell.swift
//  YouTube
//
//  Created by Min Thet Maung on 08/02/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionVideos { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
