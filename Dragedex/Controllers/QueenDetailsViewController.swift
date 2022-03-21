//
//  QueenDetailsViewController.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import UIKit

class QueenDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        doConfiguration()
        // Do any additional setup after loading the view.
    }
    
    func doConfiguration() {
        view.backgroundColor = .cyan
        let image = UIImage(systemName: "folder")
        tabBarItem = UITabBarItem(title: "Queens", image: image, tag: 0)
    }
}
