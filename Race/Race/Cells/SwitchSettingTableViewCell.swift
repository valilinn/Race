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
    
    weak var delegate: SwitchSettingDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        delegate?.cell(self, changeValueTo: `switch`.isOn)
    }
    
    
}

protocol SwitchSettingDelegate: AnyObject {
    func cell(_ cell: SwitchSettingTableViewCell, changeValueTo isOn: Bool)
}
