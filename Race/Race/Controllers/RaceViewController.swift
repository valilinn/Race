//
//  RaceViewController.swift
//  Race
//
//  Created by Валентина Лінчук on 16/07/2023.
//

import UIKit

class RaceViewController: UIViewController {
    
    //MARK: - Additional Types
    enum ElementPosition {
        case left, center, right
    }
    
    //MARK: - UI Elements
    
    
//    var carImage = UIImageView(image: UIImage(named: "carTop"))
    var carImage = UIImageView(image: UIImage(named: "mainCar"))
    var treeImageGreen = UIImageView(image: UIImage(named: "tree"))
    var treeImageBlack = UIImageView(image: UIImage(named: "treeBlack"))
    var treeImageBush = UIImageView(image: UIImage(named: "bush"))
    var rockImage = UIImageView(image: UIImage(named: "rock"))
    var rocksImage = UIImageView(image: UIImage(named: "rock1"))
    
    //MARK: - Coordinates
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
    var defaultPadding: CGFloat = 10

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carGestureLeft = UISwipeGestureRecognizer()
        carGestureLeft.direction = .left
        carGestureLeft.addTarget(self, action: #selector(carGestureAction))
        
        let carGestureRight = UISwipeGestureRecognizer()
        carGestureRight.direction = .right
        carGestureRight.addTarget(self, action: #selector(carGestureAction))
        
        
        view.addGestureRecognizer(carGestureLeft)
        view.addGestureRecognizer(carGestureRight)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        setupCoordinates()
        setupFrames()
       
    }
    
    @objc
    func carGestureAction(sender: UISwipeGestureRecognizer) {
        if carImage.frame.origin.x == centerOriginCoordinate {
            switch sender.direction {
            case .left:
                carImage.frame.origin.x = leftOriginCoordinate
//                moveRockTo(.left)
//                moveGreenTreeTo(.left)
//                moveRocksTo(.left)
//                moveBlackTreeTo(.left)
//                moveTreeBushTo(.left)
            case .right:
                carImage.frame.origin.x = rightOriginCoordinate
//                moveRockTo(.center)
//                moveGreenTreeTo(.center)
//                moveRocksTo(.center)
//                moveBlackTreeTo(.center)
//                moveTreeBushTo(.center)
                
            default:
                break
            }
        } else  {
            carImage.frame.origin.x = centerOriginCoordinate
//            moveRockTo(.right)
//            moveGreenTreeTo(.right)
//            moveRocksTo(.right)
//            moveBlackTreeTo(.right)
//            moveTreeBushTo(.right)
        }
    }
    
    
    //MARK: - Setup Views
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
        
        setupCar()
        setupTreeGreen()
        setupTreeBlack()
        setupTreeBush()
        setupRock()
        setupRocks()
        
    }
    
    func setupCar() {
        let yCoordinateOfCar = screenHeight - bottomSafeAreaPadding - defaultPadding - elementSize
        
        carImage.frame = CGRect(x: centerOriginCoordinate,
                                y: yCoordinateOfCar,
                                width: elementSize,
                                height: elementSize)
        
        carImage.layer.shadowColor = UIColor.gray.cgColor
        carImage.layer.shadowOpacity = 3
        carImage.layer.shadowOffset = .zero
        carImage.layer.cornerRadius = 15
        
        carImage.contentMode = .scaleAspectFit
        
        view.addSubview(carImage)
        
    }
    
    func setupTreeGreen() {
        let yCoordinateOfTreeGreen = (screenHeight - elementSize) / 2    // по центру
        treeImageGreen.frame = CGRect(x: centerOriginCoordinate,
                                 y: yCoordinateOfTreeGreen,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(treeImageGreen)
        
    }
    
    func setupTreeBlack() {
        let yCoordinateOfTreeBlack = topSafeAreaPadding + navigationBarHeight + defaultPadding
        treeImageBlack.frame = CGRect(x: leftOriginCoordinate,
                                 y: yCoordinateOfTreeBlack,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(treeImageBlack)
    }
    
    func setupTreeBush() {
        let yCoordinateOfTreeBush = (screenHeight - elementSize) / 2 + (elementSize * 2)
        treeImageBush.frame = CGRect(x: leftOriginCoordinate,
                                 y: yCoordinateOfTreeBush,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(treeImageBush)
    }
    
    func setupRock() {
        let yCoordinateOfRock = topSafeAreaPadding + navigationBarHeight + defaultPadding    // по центру
        rockImage.frame = CGRect(x: rightOriginCoordinate,
                                 y: yCoordinateOfRock,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(rockImage)
    }
    
    func setupRocks() {
        let yCoordinateOfRocks = (screenHeight - elementSize) / 2 + (elementSize * 2)
        rocksImage.frame = CGRect(x: rightOriginCoordinate,
                                 y: yCoordinateOfRocks,
                                 width: elementSize,
                                 height: elementSize)
        
        view.addSubview(rocksImage)
    }
    
//MARK: - Moves
    
    func moveCarTo(_ position: ElementPosition) {
        switch position {
        case .left:
            carImage.frame.origin.x = leftOriginCoordinate
        case .center:
            carImage.frame.origin.x = centerOriginCoordinate
        case .right:
            carImage.frame.origin.x = rightOriginCoordinate
        }
    }
    
    func moveRockTo(_ position: ElementPosition) {
        switch position {
        case .left:
            rockImage.frame.origin.x = centerOriginCoordinate
        case .center:
            rockImage.frame.origin.x = rightOriginCoordinate
        case .right:
            rockImage.frame.origin.x = leftOriginCoordinate
        }
    }
    
    func moveGreenTreeTo(_ position: ElementPosition) {
        switch position {
        case .left:
            treeImageGreen.frame.origin.x = rightOriginCoordinate
        case .center:
            treeImageGreen.frame.origin.x = centerOriginCoordinate
        case .right:
            treeImageGreen.frame.origin.x = leftOriginCoordinate
        }
    }
    
    func moveRocksTo(_ position: ElementPosition) {
        switch position {
        case .left:
            rocksImage.frame.origin.x = centerOriginCoordinate
        case .center:
            rocksImage.frame.origin.x = rightOriginCoordinate
        case .right:
            rocksImage.frame.origin.x = centerOriginCoordinate
        }
    }
    
    func moveBlackTreeTo(_ position: ElementPosition) {
        switch position {
        case .left:
            treeImageBlack.frame.origin.x = leftOriginCoordinate
        case .center:
            treeImageBlack.frame.origin.x = leftOriginCoordinate
        case .right:
            treeImageBlack.frame.origin.x = centerOriginCoordinate
        }
    }
    
    func moveTreeBushTo(_ position: ElementPosition) {
        switch position {
        case .left:
            treeImageBush.frame.origin.x = rightOriginCoordinate
        case .center:
            treeImageBush.frame.origin.x = leftOriginCoordinate
        case .right:
            treeImageBush.frame.origin.x = leftOriginCoordinate
        }
    }
    
}
