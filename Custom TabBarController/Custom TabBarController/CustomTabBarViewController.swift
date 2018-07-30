//
//  CustomTabBarViewController.swift
//  Custom TabBarController
//
//  Created by JeremyXue on 2018/7/30.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    let customButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Home" {
            customButton.backgroundColor = .white
        } else {
            customButton.backgroundColor = .gray
        }
    }
    
    func settingButton() {
        let image = UIImage(named: "controller")
        customButton.setImage(image, for: .normal)
        customButton.frame.size = CGSize(width: 60, height: 60)
        customButton.center = CGPoint(x: tabBar.bounds.midX, y: tabBar.bounds.midY - customButton.frame.height / 3)
        customButton.backgroundColor = .gray
        customButton.layer.cornerRadius = 15
        customButton.layer.borderColor = UIColor.black.cgColor
        customButton.layer.borderWidth = 3
        customButton.clipsToBounds = true
        customButton.adjustsImageWhenHighlighted = false
        customButton.addTarget(self, action: #selector(showViewController), for: .touchDown)
        tabBar.addSubview(customButton)
    }
    
    @objc func showViewController() {
        customButton.backgroundColor = .white
        self.selectedIndex = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach { (touch) in
            let position = touch.location(in: tabBar)
            let offset = customButton.frame.height / 3
            if customButton.frame.minX <= position.x && position.x <= customButton.frame.maxX {
                if customButton.frame.minY - offset <= position.y && position.y <= customButton.frame.maxY - offset{
                    showViewController()
                }
            }
        }
    }
    
}
