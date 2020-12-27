//
//  UtilityHelper.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 12/12/2020.
//

import Foundation
import AVFoundation
import UIKit

class UtilityHelper {
    
    
    class func getThumbnailImageFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?, _ duration: CMTime?)->Void)) {
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
            avAssetImageGenerator.appliesPreferredTrackTransform = true
            let thumnailTime = CMTimeMake(value: 2, timescale: 1)
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
                //let duration : CMTime = asset.duration
                let thumbImage = UIImage(cgImage: cgThumbImage)
                DispatchQueue.main.async {
                    completion(thumbImage, asset.duration)
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            }
        }
    }
    
    class func extractYouTubeId(from url: String) -> String? {
        let regex = try? NSRegularExpression(pattern: youtubePattern, options: .caseInsensitive)
        return regex
            .flatMap { $0.firstMatch(in: url, range: NSMakeRange(0, url.count)) }
            .flatMap { Range($0.range(at: 1), in: url) }
            .map { String(url[$0]) }
    }
}
