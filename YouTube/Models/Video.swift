//
//  Video.swift
//  YouTube
//
//  Created by Min Thet Maung on 20/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

struct Video: Codable {
    var title: String?
    var channel: Channel?
//    var uploadDate: NSDate?
    var uploadDate: Date?
//    var duration: NSNumber?
    var duration: Int?
    var number_of_views: Int?
//    var number_of_views: NSNumber?
    var thumbnail_image_name: String?
}

struct Channel: Codable {
    var name: String?
    var profile_image_name: String?
}
