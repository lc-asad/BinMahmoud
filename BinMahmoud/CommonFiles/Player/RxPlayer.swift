//
//  RxPlayer.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 14/12/2020.
//

import Foundation
import RxSwift
import RxCocoa
import AVKit

enum RxPlayerState {
    case Playing
    case Paused
    case Failed
    case Unknown
}

class RxPlayer {
    
    private var state = BehaviorRelay<RxPlayerState>(value: .Unknown)
    private var currentItem = BehaviorSubject<VideoListingModel?>(value: nil)
    private var player = AVPlayer()
    private let bag = DisposeBag()
    
    
    init() {
        subscibeToState()
        subscribeToCurrentItem()
        subscribeToPlayerStatus()
    }
    
    private func subscibeToState() {
        state.subscribe(onNext: { [weak self] value in
            switch value {
            case .Playing:
                self?.player.play()
            case .Paused:
                self?.player.pause()
            case .Failed:
                print("Failed")
            default:
                break
            }
        }).disposed(by: bag)
    }
    
    private func subscribeToCurrentItem() {
        currentItem.subscribe(onNext: { [weak self] item in
            guard let file_url = item?.file_name else {
                return
            }
            
            if let url = URL(string:file_url){
                self?.player.replaceCurrentItem(with: AVPlayerItem(url: url))
            }
            
        }).disposed(by: bag)
    }
    
    private func subscribeToPlayerStatus() {
        player.rx.status.subscribe(onNext: { status in
            switch status {
            case .unknown:
                self.state.accept(.Unknown)
            case .failed:
                self.state.accept(.Failed)
            case .readyToPlay:
                self.state.accept(.Playing)
            default:
                break
            }
        }).disposed(by: bag)
    }
    
    
    func playItem(_ item: VideoListingModel) {
        compareCurrentItemURL(currentItemURL: getRxPlayerCurrentItemURL(),
                              item: item)
    }
    
    private func getRxPlayerCurrentItemURL() -> URL? {
        return (player.currentItem?.asset as? AVURLAsset)?.url
    }
    
    private func compareCurrentItemURL(currentItemURL: URL?, item: VideoListingModel) {
        
        if let fileUrl = item.file_name {
            guard let url = URL(string: fileUrl) else {
                print("error occured!")
                return
            }
    
            if currentItemURL != url {
                currentItem.onNext(item)
            }
            
            if currentItemURL == url {
                switch state.value {
                case .Paused:
                    state.accept(.Playing)
                case .Playing:
                    state.accept(.Paused)
                default:
                    break
                }
            }
        }
        
    }
    
}

extension Reactive where Base: AVPlayer {
    public var status: Observable<AVPlayer.Status> {
        return self.observe(AVPlayer.Status.self, #keyPath(AVPlayer.status))
            .map { $0 ?? .unknown }
    }
}
