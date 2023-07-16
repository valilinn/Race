//
//  RaceViewController.swift
//  Race
//
//  Created by Валентина Лінчук on 16/07/2023.
//

import UIKit

class RaceViewController: UIViewController {
    
    @IBOutlet weak var carPositionSegmentControl: UISegmentedControl!
    
    
    var carImage = UIImageView(image: UIImage(named: "carTop"))
//    var carImage = UIImageView(image: UIImage(named: "mainCar"))
    var treeImageGreen = UIImageView(image: UIImage(named: "tree"))
    var treeImageBlack = UIImageView(image: UIImage(named: "tree1"))
    var treeImageBush = UIImageView(image: UIImage(named: "bush"))
    var rockImage = UIImageView(image: UIImage(named: "rock"))
    var rocksImage = UIImageView(image: UIImage(named: "rock1"))
    
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var bottomSafeAreaPadding: CGFloat = 0
    var topSafeAreaPadding: CGFloat = 0
    var navigationBarHeight: CGFloat = 0
    

    
    //x
    var leftOriginCoordinate: CGFloat = 0
    var centerOriginCoordinate: CGFloat = 0
    var rightOriginCoordinate: CGFloat = 0
    
    //car size
    var elementSize: CGFloat = 0
    var defaultPadding: CGFloat = 40

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        setupCoordinates()
        setupFrames()
       
    }
    
    func setupCoordinates() {
        screenHeight = view.frame.size.height
        screenWidth = view.frame.size.width
        bottomSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        topSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
       navigationBarHeight = navigationController?.navigationBar.frame.size.height ?? 0

        
        elementSize = screenWidth / 4
        leftOriginCoordinate = elementSize / 4
        centerOriginCoordinate = elementSize + 2 * leftOriginCoordinate
        rightOriginCoordinate = 2 * elementSize + 3 * leftOriginCoordinate
    }
    
    func setupFrames() {
        
       
        
        carPositionSegmentControl.selectedSegmentIndex = 1
        //y
        let yCoordinateOfCar = screenHeight - bottomSafeAreaPadding - defaultPadding - elementSize
        
        
        carImage.frame = CGRect(x: centerOriginCoordinate,
                                y: yCoordinateOfCar,
                                width: elementSize,
                                height: elementSize)
        
        view.addSubview(carImage)
        
        let yCoordinateOfTreeGreen = (screenHeight - elementSize) / 2    // по центру
        treeImageGreen.frame = CGRect(x: leftOriginCoordinate,
                                 y: yCoordinateOfTreeGreen,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(treeImageGreen)
        
        let yCoordinateOfTreeBlack = topSafeAreaPadding + navigationBarHeight + defaultPadding
        treeImageBlack.frame = CGRect(x: leftOriginCoordinate,
                                 y: yCoordinateOfTreeBlack,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(treeImageBlack)
        
        let yCoordinateOfTreeBush = (screenHeight - elementSize) / 2 + (elementSize * 2)
        treeImageBush.frame = CGRect(x: leftOriginCoordinate,
                                 y: yCoordinateOfTreeBush,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(treeImageBush)
        
        let yCoordinateOfRock = topSafeAreaPadding + navigationBarHeight + defaultPadding    // по центру
        rockImage.frame = CGRect(x: rightOriginCoordinate,
                                 y: yCoordinateOfRock,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(rockImage)
        
        let yCoordinateOfRocks = (screenHeight - elementSize) / 2 + (elementSize * 2)
        rocksImage.frame = CGRect(x: rightOriginCoordinate,
                                 y: yCoordinateOfRocks,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(rocksImage)
    }
    

    @IBAction func changeCarPosition(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            carImage.frame.origin.x = leftOriginCoordinate
            rockImage.frame.origin.x = centerOriginCoordinate
            treeImageGreen.frame.origin.x = rightOriginCoordinate
            rocksImage.frame.origin.x = centerOriginCoordinate
            treeImageBlack.frame.origin.x = leftOriginCoordinate
            treeImageBush.frame.origin.x = rightOriginCoordinate
        case 2:
            carImage.frame.origin.x = rightOriginCoordinate
            rockImage.frame.origin.x = leftOriginCoordinate
            treeImageGreen.frame.origin.x = centerOriginCoordinate
            rocksImage.frame.origin.x = centerOriginCoordinate
            treeImageBlack.frame.origin.x = centerOriginCoordinate
            treeImageBush.frame.origin.x = leftOriginCoordinate
        default:
            carImage.frame.origin.x = centerOriginCoordinate
            rockImage.frame.origin.x = rightOriginCoordinate
            treeImageGreen.frame.origin.x = leftOriginCoordinate
            rocksImage.frame.origin.x = rightOriginCoordinate
            treeImageBlack.frame.origin.x = leftOriginCoordinate
            treeImageBush.frame.origin.x = leftOriginCoordinate
        }
        
    }
    
}
