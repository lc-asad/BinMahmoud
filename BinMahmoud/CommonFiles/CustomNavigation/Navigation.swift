//
//  Navigation.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 10/12/2020.
//

import UIKit

class Navigation: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyBarTintColorToNavigationBar()
        addSegmentControl(segmentItems: ["المفضلة", "المرئيات"])
        leftButtonWithImage(name: "setting_icon")
        rightButtonWithImage(name: "menu_icon")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
    }
    
    func applyBarTintColorToNavigationBar() {
        
        let darkendBarTintColor = #colorLiteral(red: 0.9607843137, green: 0.9333333333, blue: 0.8862745098, alpha: 1)
        let navigationBarAppearance = self.navigationController?.navigationBar
        navigationBarAppearance?.barTintColor = darkendBarTintColor
        
    }
    
    func addSegmentControl(segmentItems : [String]) {
        
       let control = UISegmentedControl(items: segmentItems)
       control.frame = CGRect(x: 0, y: 0, width: 220, height: 34)
       control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
       control.selectedSegmentIndex = 1
       control.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Cairo-SemiBold", size: 15)!], for: .normal)
        control.apportionsSegmentWidthsByContent = true
        self.navigationItem.titleView = control
        
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            self.selectedSegmentIndex(index: 0)
          break
          case 1:
            self.selectedSegmentIndex(index: 1)
          break
          default:
          break
       }
    }
    
    func selectedSegmentIndex(index: Int) {
        Logger.info("selected segment : \(index)")
    }
    
    func leftButtonWithImage(name: String) {
        
        // Add the custom image button as the nav bar's custom left view.
        
        let leftButton = UIBarButtonItem(image: UIImage(named: name)?.withRenderingMode(.alwaysOriginal),
                                          style: .plain,
                                          target: self,
                                          action: #selector(leftButtonAction(_:)))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    func rightButtonWithImage(name: String) {
        
        // Add the custom image button as the nav bar's custom right view.
        let rightButton = UIBarButtonItem(image: UIImage(named: name)?.withRenderingMode(.alwaysOriginal),
                                          style: .plain,
                                          target: self,
                                          action: #selector(rightButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    /// IBAction for UINavigation left button
    @IBAction func leftButtonAction(_ sender: UIBarButtonItem) {
        
        Swift.debugPrint("CustomRightViewController IBAction invoked")
    }
    
    /// IBAction for UINavigation left button
    @IBAction func rightButtonAction(_ sender: UIBarButtonItem) {
        
        Swift.debugPrint("CustomRightViewController IBAction invoked")
    }
    
}
