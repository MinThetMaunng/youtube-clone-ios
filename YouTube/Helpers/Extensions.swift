//
//  Extensions.swift
//  YouTube
//
//  Created by Min Thet Maung on 17/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

extension UIView {
    func addConstraintWithFormat(format: String, views: UIView...) {
        var viewDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDict))
    }
}

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        let url = URL(string: urlString)
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: NSString(string: urlString)) as? UIImage {
            image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("requesting image url error : \(error)")
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                if self.imageUrlString == urlString {
                    imageCache.setObject(imageToCache!, forKey: NSString(string: urlString))
                }
                self.image = imageToCache
            }
        }.resume()
    }
}
