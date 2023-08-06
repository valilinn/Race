//
//  SettingsManager.swift
//  Race
//
//  Created by Валентина Лінчук on 09/07/2023.
//

import Foundation

class SettingsManager {
    
    static var shared = SettingsManager()
    
    private init() { }
    
    var settings = [
        Setting(settingName: "Username", type: .stringSetting, settingValue: ""),
        Setting(settingName: "Music", type: .switchSetting, settingValue: true),
        Setting(settingName: "Sound", type: .switchSetting, settingValue: true),
        Setting(settingName: "Obstacles", type: .openSetting, settingValue: "Cars"),
        Setting(settingName: "Car Color", type: .openSetting, settingValue: "Red"),
        Setting(settingName: "Car Model", type: .openSetting, settingValue: "Lamborghini")
    ]
}
