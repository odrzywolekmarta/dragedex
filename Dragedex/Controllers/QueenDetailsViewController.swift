//
//  QueenDetailsViewController.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import UIKit

class QueenDetailsViewController: UIViewController {
    @IBOutlet var queensImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var seasonsLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doConfiguration()
    }
    
    func doConfiguration() {
    }
}
