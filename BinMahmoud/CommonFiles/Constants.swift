//
//  Constants.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 03/12/2020.
//

import Foundation
import UIKit


struct Reference {
    
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    
    struct StoryboardRef {
        
        static let Main : UIStoryboard = UIStoryboard(name: Reference.Storyboards.Main, bundle: nil)
        
    }
    
    struct Storyboards {
        
        static let Main = "Main"
    }
    
    struct Nibs {
        static let FooterCollectionViewCell = String(describing: ReusableFooterCollectionViewCell.self)
        static let vedioListingCell = String(describing: VideoListGridCell.self)
        
    }
    
    struct CellIdentifiers {
        
        static let FooterCollectionViewCell = String(describing: ReusableFooterCollectionViewCell.self)
        static let vedioListingCell = String(describing: VideoListGridCell.self)
    }
    
    struct ViewControllerIds {
        
        static let TabBAr =  String(describing: MainTabBarController.self)
    }
        
}

//MARK: - Constants
let BaseURLLive  = "https://backend.ibn-mahmoud.com/api/v1"
let youtubePattern = "(?:(?:\\.be\\/|embed\\/|v\\/|\\?v=|\\&v=|\\/videos\\/)|(?:[\\w+]+#\\w\\/\\w(?:\\/[\\w]+)?\\/\\w\\/))([\\w-_]+)"

