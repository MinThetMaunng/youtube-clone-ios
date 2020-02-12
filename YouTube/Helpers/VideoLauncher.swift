//
//  VideoLauncher.swift
//  YouTube
//
//  Created by Min Thet Maung on 11/02/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        return aiv
    }()
    
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlayerView ()
        
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        addSubview(activityIndicatorView)
        
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundColor = .black
    }
    
     private func setupPlayerView() {
        let urlstring = "https://videolinkforios.herokuapp.com/static/video1.mp4"
        if let url = URL(string: urlstring) {
            let player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            player.play()
            player.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges" {
            activityIndicatorView.stopAnimating()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoLauncher: NSObject {
    func showVideoPlayer() {
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView()
            view.backgroundColor = .white
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            let height = keyWindow.frame.width * (9 / 16)
            let videoPlayerFrame = CGRect(x: 0, y:  0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = CGRect(x: 0, y: UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0, width: keyWindow.frame.width, height: keyWindow.frame.height) //keyWindow.frame
            }) { (complete) in
//                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            }
        }
        
    }
}
