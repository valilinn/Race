//
//  AppDelegate.swift
//  Race
//
//  Created by Валентина Лінчук on 08/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Color of tint
        UINavigationBar.appearance().tintColor = UIColor.gray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.gray]
        
        return true
    }
    
    private func setupUserDefaults() {
        let ud = UserDefaults.standard
        
        if !ud.bool(forKey: "gotDefaultValues") {
            ud.set(true, forKey: "isMusicOn")
            ud.set(true, forKey: "isSoundOn")
            ud.set("Obstacles", forKey: "nameOfObstacles")
            ud.set("0000", forKey: "codeOfColor")
            ud.set("Opel", forKey: "nameOfModel")
            ud.set("User", forKey: "userName")
            ud.set(true, forKey: "gotDefaultValues")
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

