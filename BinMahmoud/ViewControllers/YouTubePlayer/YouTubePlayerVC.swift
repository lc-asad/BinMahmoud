//
//  YouTubePlayerVC.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 16/12/2020.
//

import UIKit
import RxSwift
import YouTubePlayer

class YouTubePlayerVC: UIViewController,Storyboarded {
    
    // MARK: - IBOutlet
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Properties
    var viewModel: YouTubePlayerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addObserver()
        
        videoPlayer.delegate = self
        loadVideo()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.videoPlayer.play()
        })
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: .kAVPlayerViewControllerDismissingNotification, object: nil)
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(onCloseClicked(_:)), name: .kAVPlayerViewControllerDismissingNotification, object: nil)
    }
    
    private func loadVideo() {
        guard let viewModel = viewModel else { return }
        
        videoPlayer.playerVars = [
            "autoplay": "1",
            "allow" : "autoplay",
            "playsinline": "0",
            "controls": "1",
            "showinfo": "0",
            "rel": "0"
        ] as YouTubePlayerView.YouTubePlayerParameters
        
        if let urlString = viewModel.videoUrl {
            let videoUrl = URL(string: urlString)
            videoPlayer.loadVideoURL(videoUrl!)
        }
        
    }
    
    
    @objc func onCloseClicked(_ notification:Notification) {
        viewModel?.didTapFinish.onNext(())
    }
    
}

extension YouTubePlayerVC : YouTubePlayerDelegate {
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        print("Player state : \(playerState)")
    }
    
}
