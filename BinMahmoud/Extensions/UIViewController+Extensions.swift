//
//  UIViewController+Extensions.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 15/12/2020.
//

import Foundation
import UIKit


extension UIViewController {
    
    func configureDismissKeyboard() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))
    }
    
    @objc private func handleTap(sender: UITapGestureRecognizer? = nil) {
        sender?.view?.endEditing(true)
    }
    
    func presentOnTop(_ viewController: UIViewController, animated: Bool) {
        var topViewController = self
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        topViewController.present(viewController, animated: animated)
    }
}

