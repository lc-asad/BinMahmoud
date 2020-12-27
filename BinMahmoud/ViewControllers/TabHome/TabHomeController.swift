//
//  TabHomeController.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 09/12/2020.
//

import UIKit

class TabHomeController: Navigation, Storyboarded {

    // MARK: - Properties
    var viewModel: TabHomeViewModel?
    
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
