//
//  ReusableFooterView.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 03/12/2020.
//

import UIKit
import Foundation

protocol FooterViewProtocol:class {
    
    func moveToScree(index: Int)
}

class ReusableFooterView: UIView {
    
    // constants
    let nibName = "ReusableFooterView"
    
    //IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // delegate
    weak var delegate: FooterViewProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    fileprivate func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        
        initCollectionView()
        
    }
    
    fileprivate func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "ReusableFooterCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Reference.CellIdentifiers.FooterCollectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate  = self
        
    }
    
}

extension ReusableFooterView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Reference.CellIdentifiers.FooterCollectionViewCell, for: indexPath) as! ReusableFooterCollectionViewCell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate?.moveToScree(index: indexPath.row)
    }
    
}

extension ReusableFooterView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if Reference.IS_IPAD {
            return CGSize(width: (collectionView.frame.size.width/3)-8 , height: 180)
        }
        else {
            return CGSize(width: (collectionView.frame.size.width/3)-8 , height: 120)
        }
    }
}

