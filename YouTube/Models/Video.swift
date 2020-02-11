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
    var duration: Int?
    var channel: Channel?
    var uploadDate: Date?
    var number_of_views: Int?
    var thumbnail_image_name: String?
}

struct Channel: Codable {
    var name: String?
    var profile_image_name: String?
}
