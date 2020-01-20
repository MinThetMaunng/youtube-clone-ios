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
    var thumbnailImageName: String?
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
