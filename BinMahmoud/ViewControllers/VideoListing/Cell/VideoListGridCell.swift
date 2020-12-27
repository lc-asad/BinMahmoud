//
//  VideoListingCell.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 10/12/2020.
//

import CoreMedia
import UIKit
import BBWebImage
import RxSwift

class VideoListGridCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var vedioImageView: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var durationView: UIView!
    
    //MARK: - Variables
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        durationView.layer.cornerRadius = 10
    }
    
    func setCellData(videoitem : VideoListingModel)  {
        
        lblTitle?.text = videoitem.title
        lblDescription?.text = videoitem.short_summary
        
        if let imageurl = videoitem.file_name {
            
            if let isYoutube = videoitem.is_youtube, isYoutube == 1 {
                let youtubeId = UtilityHelper.extractYouTubeId(from: imageurl)
                guard let youtubeVideoId = youtubeId else {
                    return
                }
                
                downloadYoutubeThumbWith(youtubeId: youtubeVideoId)
                
            }
            else {
                guard let videoUrl = URL(string: imageurl) else { return }
                
                UtilityHelper.getThumbnailImageFromVideoUrl(url: videoUrl) { (thumbImage,duration) in
                    
                    if let timeduration = duration {
                        
                        //let durationInSeconds = CMTimeGetSeconds(timeduration)
                        self.lblDuration?.text = timeduration.timeString
                        
                    }
                    
                    self.vedioImageView.image = thumbImage
                }
            }
        }
        
    }
    
    func downloadYoutubeThumbWith(youtubeId: String?) {
        
        guard let youtubeVideoId = youtubeId else {
            return
        }
        
        let urlstr = "http://img.youtube.com/vi/\(youtubeVideoId)/maxresdefault.jpg"
        vedioImageView.bb_setImage(with: URL(string: urlstr)!)
    }
}
