//
//  Common+Extensions.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 09/12/2020.
//

import UIKit
import AVKit
import AVFoundation

//MARK:- UIColor
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

//MARK:- URL
extension URL {
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
}

//MARK:- AVPlayerViewController extension
extension Notification.Name {
    static let kAVPlayerViewControllerDismissingNotification = Notification.Name.init("dismissing")
}

extension AVPlayerViewController {
    // override 'viewWillDisappear'
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // and then , post a simple notification and observe & handle it, where & when you need to.....
        NotificationCenter.default.post(name: .kAVPlayerViewControllerDismissingNotification, object: nil)
        // now, check that this ViewController is dismissing
        if self.isBeingDismissed == false {
            return
        }
        
    }
}

//MARK:- UINavigation Bar
extension UINavigationBar {

    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}
