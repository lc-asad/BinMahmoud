//
//  AudioListingVC.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit

class AudioListingVC: Navigation, Storyboarded {
    
    // MARK: - Properties
    var viewModel: AudioListingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    

    @IBAction override func rightButtonAction(_ sender: UIBarButtonItem) {
        
        Swift.debugPrint("CustomRightViewController IBAction invoked")
    }
    
    @IBAction override func leftButtonAction(_ sender: UIBarButtonItem) {
        
        Swift.debugPrint("CustomRightViewController IBAction invoked")
    }

}
