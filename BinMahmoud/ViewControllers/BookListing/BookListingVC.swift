//
//  BookListingVC.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit

class BookListingVC: Navigation,Storyboarded {

    // MARK: - Properties
    var viewModel: BookListingViewModel?

    
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
