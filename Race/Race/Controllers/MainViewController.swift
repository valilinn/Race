//
//  MainViewController.swift
//  Race
//
//  Created by Валентина Лінчук on 16/07/2023.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        animationView!.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUserName(_:)), name: NSNotification.Name("updateUserName"), object: nil)
        
        helloLabel.text = "Hello, " + (UserDefaults.standard.string(forKey: "username") ?? "") + "!"

    }
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func updateUserName(_ notification: Notification) {
        var username = "Userr"
        if let newName = notification.userInfo?["username"] as? String {
            username = newName
        }
        helloLabel.text = "Hello, \(username)!"
    }

  
    
    @IBAction func startRace(_ sender: Any) {
        
        let destination = RaceViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func blurBackground() {
        let blur = UIBlurEffect(style: .systemMaterialLight)
        let blurEffectView = UIVisualEffectView(effect: blur)
        blurEffectView.frame = mainImage.bounds
        blurEffectView.alpha = 0.2
        mainImage.addSubview(blurEffectView)
    }

}
