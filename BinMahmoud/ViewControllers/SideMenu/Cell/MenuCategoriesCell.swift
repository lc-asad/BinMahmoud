//
//  MenuCategoriesCell.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/12/2020.
//

import UIKit
import RxSwift

class MenuCategoriesCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var arrowImageVw: UIImageView!
    
    //MARK: - Constants
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        arrowImageVw.transform = CGAffineTransform(rotationAngle: .pi)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(menuitem : CategoriesSideMenuModel)  {
        
        lblTitle?.text = menuitem.cat_name
        lblCount?.text = ""
        
    }

}
