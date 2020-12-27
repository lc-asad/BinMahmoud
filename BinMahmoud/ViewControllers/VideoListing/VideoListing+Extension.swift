//
//  VideoListing+Extension.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 10/12/2020.
//

import UIKit

extension VideoListingVC {

    func setupUI() {
        inputSearchView.layer.cornerRadius = inputSearchView.frame.size.height/2
    }
    
    func showSettingsPopover(sender: UIBarButtonItem) {
        
        let viewController = SettingsPopoverVC.instantiate()
        viewController.view.backgroundColor = UIColor.init(hex: "#f8f3ea")
        viewController.modalPresentationStyle = UIModalPresentationStyle.popover

        let popvc = viewController.popoverPresentationController
        popvc?.delegate = self

        popvc?.permittedArrowDirections = UIPopoverArrowDirection.any
        popvc?.barButtonItem = sender
        if Reference.IS_IPAD {
            viewController.preferredContentSize = CGSize.init(width: 300, height: 400)
        }
        else {
            viewController.preferredContentSize = CGSize.init(width: 214, height: 300)
        }
        
        
        viewController.onDoneBlock = { item in
            self.reArrangeList(itemId: item)
        }
        self.present(viewController, animated: true, completion: nil)
    }
}

extension VideoListingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if Reference.IS_IPAD {
            if isGridListing {
                return CGSize(width: (collectionView.bounds.width-4)/2, height: 380)
            }
            else {
                return CGSize(width: (collectionView.bounds.width), height: 240)
            }
        }
        else {
            if isGridListing {
                return CGSize(width: (collectionView.bounds.width-2)/2, height: 220)
            }
            else{
                return CGSize(width: (collectionView.bounds.width), height: 110)
            }
        }
    }
}

extension VideoListingVC: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
}
