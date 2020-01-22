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
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
    override init() {
        super.init()
    }
}
