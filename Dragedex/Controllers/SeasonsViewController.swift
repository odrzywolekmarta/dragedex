//
//  SeasonsViewController.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import UIKit

class SeasonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        doConfiguration()
        // Do any additional setup after loading the view.
    }
    
    func doConfiguration() {
        view.backgroundColor = .red
        let image = UIImage(systemName: "folder.fill")
        tabBarItem = UITabBarItem(title: "Seasons", image: image, tag: 1)
    }
   
}
