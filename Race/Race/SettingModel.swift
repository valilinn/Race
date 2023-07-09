//
//  SettingModel.swift
//  Race
//
//  Created by Валентина Лінчук on 09/07/2023.
//

import Foundation

struct Setting {
    let settingName: String
    let type: SettingType
    var settingValue: Any
}

enum SettingType {
    case switchSetting
    case openSetting
}
