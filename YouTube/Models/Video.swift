//
//  Video.swift
//  YouTube
//
//  Created by Min Thet Maung on 20/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class Video: NSObject {
    var title: String?
    var channel: Channel?
    var uploadDate: NSDate?
    var numberOfViews: NSNumber?
    var thumbnailImageName: String?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
