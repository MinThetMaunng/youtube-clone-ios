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
    private let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> () ) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
    }
    
    func fetchTrendingVideos(completion: @escaping ([Video]) -> () ) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionVideos(completion: @escaping ([Video]) -> () ) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        guard let url = URL(string: urlString) else { return }
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
