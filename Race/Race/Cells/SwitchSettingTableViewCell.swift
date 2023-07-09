//
//  SwitchSettingTableViewCell.swift
//  Race
//
//  Created by Валентина Лінчук on 09/07/2023.
//

import UIKit

class SwitchSettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var settingName: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
