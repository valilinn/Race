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
//    private var animationView: LottieAnimationView?
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        animationView = .init(name: "lottieCar")
//        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
//        view.addSubview(animationView!)
        animationView!.play()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
