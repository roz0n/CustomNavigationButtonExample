//
//  MainTabBarController.swift
//  HabitTreeNavExample
//
//  Created by Arnaldo Rozon on 4/22/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tabBar.tintColor = .white
        
        createAddButton()
    }
    
    func createAddButton() {
        // Create button frame
        // tabBar fits max 5 icons, so for the size of one icon, divide with of tabBar by 5
        // Height of an icon should be approx. the height of tabBar
        let buttonFrame = CGRect(x: 0.0, y: 0.0, width: (self.tabBar.frame.width / 5), height: self.tabBar.frame.height)
        
        // Initialize the button
        addButton = UIButton(frame: buttonFrame)
        // Set the button's center point
        addButton.center = CGPoint(x: self.tabBar.center.x, y: (self.tabBar.frame.height / 2) + 3)
        // Set the button's position on the z-axis
        addButton.layer.zPosition = 2
        
        // We're using system symbols, aka SF Symbols, this is how these are initialized with special configs
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 36, weight: .black)
        let buttonImage = UIImage(systemName: "plus.circle.fill", withConfiguration: imageConfig)
        
        // setImage allows us to set images to buttons
        addButton.setImage(buttonImage, for: .normal)
        
        // add target, meaning, add a gesture recognizer (for taps, in this case)
        addButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
        // Add the button to the tabBar (superview)
        tabBar.addSubview(addButton)
    }
    
    @objc func handleButtonTap() {
        // Make sure this name matches what you've named it in the storyboard
        performSegue(withIdentifier: "OpenForm", sender: self)
    }

}

