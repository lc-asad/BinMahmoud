//
//  SettingsPopoveCell.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 13/12/2020.
//

import UIKit

class SettingsPopoveCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(listitem : SettingsPopoverModel)  {
        lblTitle.text = listitem.title
        
        if listitem.selected && listitem.image_name == "radio" {
            settingImageView.image = UIImage.init(named: "radio_fill")
        }
        else {
            settingImageView.image = UIImage.init(named: listitem.image_name)
        }
        
    }

}
