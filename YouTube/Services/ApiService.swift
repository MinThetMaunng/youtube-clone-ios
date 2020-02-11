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
                let videos = try JSONDecoder().decode([Video].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(videos)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
}
