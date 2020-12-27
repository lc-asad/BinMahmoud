//
//  VideoListCell.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/12/2020.
//

import UIKit
import BBWebImage
import RxSwift

class VideoListCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var vedioImageView: UIImageView!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    //MARK: - Variables
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellData(videoitem : VideoListingModel)  {
        
        lblTitle?.text = videoitem.title
        lblDescription?.text = videoitem.short_summary
        
        if let imageurl = videoitem.file_name {
            if let isYoutube = videoitem.is_youtube, isYoutube == 1 {
                let youtubeId = UtilityHelper.extractYouTubeId(from: imageurl)
                guard let youtubeVideoId = youtubeId else {return}
                downloadYoutubeThumbWith(youtubeId: youtubeVideoId)
                
            }
            else {
                guard let videoUrl = URL(string: imageurl) else { return }
                
                UtilityHelper.getThumbnailImageFromVideoUrl(url: videoUrl) { (thumbImage,duration) in
                    if let timeduration = duration {
                        Logger.info(" \(timeduration)")
                    }
                    self.vedioImageView.image = thumbImage
                }
            }
        }
        
    }
    
    func downloadYoutubeThumbWith(youtubeId: String?) {
        
        guard let youtubeVideoId = youtubeId else { return }
        let urlstr = "http://img.youtube.com/vi/\(youtubeVideoId)/maxresdefault.jpg"
        vedioImageView.bb_setImage(with: URL(string: urlstr)!)
    }
}
