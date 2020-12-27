//
//  SideMenuViewController.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 22/12/2020.
//
import Foundation
import UIKit
import SideMenu

class SideMenuViewController: Navigation {
    var panGesture = UIPanGestureRecognizer()
    var edgeGesture = UIScreenEdgePanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture = SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
        
        edgeGesture = SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: navigationController!.view, forMenu: .left)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enableSideMenu()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        disableSideMenu()
    }
    
    func disableSideMenu() {
        panGesture.isEnabled = false
        edgeGesture.isEnabled = false
    }
    
    func enableSideMenu() {
        panGesture.isEnabled = true
        edgeGesture.isEnabled = true
    }
    
    func showSideMenu() {
        present(SideMenuManager.default.rightMenuNavigationController!, animated: true, completion: nil)
    }
    
}

