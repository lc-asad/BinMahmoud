//
//  ViewController.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/11/2020.
//

import UIKit

class LandingViewController: UIViewController,FooterViewProtocol,Storyboarded {

    // IBOutlets
    @IBOutlet weak var inputSearchView: UIView!
    @IBOutlet weak var footerView: ReusableFooterView!
    @IBOutlet weak var FooterViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnSheikh: UIButton!
    
    // MARK: - Properties
    var viewModel: LandingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
    
        footerView.delegate = self
        inputSearchView.layer.cornerRadius = inputSearchView.frame.size.height/2
        btnSheikh.layer.cornerRadius = btnSheikh.frame.size.height/2
        btnSheikh.layer.borderWidth = 1
        btnSheikh.layer.borderColor = UIColor.init(red: 143/256, green: 16/256, blue: 16/256, alpha: 1.0).cgColor
    }
    
    
 //MARK: - Delegate methods
    func moveToScree(index: Int) {
        
        viewModel?.didSelectIndex.onNext(index)
    }
    
}

