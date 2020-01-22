//
//  SettingsLauncher.swift
//  YouTube
//
//  Created by Min Thet Maung on 22/01/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    
    let  blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let height: CGFloat = 200 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0,y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
            
//            UIView.animate(withDuration: 0.5) {
//                self.blackView.alpha = 1
//                self.collectionView.frame = CGRect(x: 0,y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
//            }
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.3) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0,y: window.frame.height , width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
    
    override init() {
        super.init()
    }
}
