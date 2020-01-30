//
//  ApiService.swift
//  YouTube
//
//  Created by Min Thet Maung on 30/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class ApiService: NSObject {

    
    static let sharedInstance = ApiService()
    
    func fetchVideos(completion: @escaping ([Video]) -> () ) {
        guard let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error : \(error)")
                return
            }
            do {
                let json = try  JSONSerialization.jsonObject(with: data!, options: .mutableContainers )
                var videos = [Video]()
                for dictionary in json as! [[String: AnyObject]] {
                    let channelDict = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channelDict["name"] as? String
                    channel.profileImageName = channelDict["profile_image_name"] as? String
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    video.title = dictionary["title"] as? String
                    video.channel = channel
                    videos.append(video)
                }
                DispatchQueue.main.async {
                    completion(videos)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
        
    }
}
