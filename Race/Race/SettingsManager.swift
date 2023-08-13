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
    
    var isMusicOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isMusicOn")
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "isMusicOn")
        }
    }
     
    var isSoundOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isSoundOn")
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "isSoundOn")
        }
    }
    
    var nameOfObstacles: String {
        get {
            UserDefaults.standard.string(forKey: "nameOfObstacles") ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "nameOfObstacles")
        }
    }
    
    var codeOfColor: String {
        get {
            UserDefaults.standard.string(forKey: "codeOfColor") ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "codeOfColor")
        }
    }
    
    var nameOfModel: String {
        get {
            UserDefaults.standard.string(forKey: "nameOfModel") ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "nameOfModel")
        }
    }
    
    var userName: String {
        get {
            UserDefaults.standard.string(forKey: "userName") ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
    }
    

}
